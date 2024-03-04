defmodule SmeeView.EntityAttributes do

  @moduledoc """
  This module can extracts the `<mdattr:EntityAttributes>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.EntityAttribute, roles: false

  @entity_xmap [
    ~x"//md:Extensions/mdattr:EntityAttributes/saml:Attribute"le,
    name: ~x"string(@Name)"s,
    values: ~x"string(saml:AttributeValue)"ls
  ]

  @doc """
  Returns true if the aspects contain the specified attribute name

  ```
  SmeeView.EntityAttributes.contain?(ent_attrs, "urn:oasis:names:tc:SAML:attribute:assurance-certification")
  # => true


  ```

  """
  @spec contain?(aspects :: list() | map(), name :: binary()) :: boolean() | map()
  def contain?(aspects, name) when is_map(aspects), do: prismify(aspects, name, &contain?/2)
  def contain?(aspects, name) do
    aspects
    |> Enum.any?(fn a -> a.name == name end)
  end

  @doc """
  Returns true if the aspects contain the specified attribute type/name and value

  ```
  SmeeView.EntityAttributes.contain?(ent_attrs, "urn:oasis:names:tc:SAML:attribute:assurance-certification", "https://refeds.org/sirtfi2")
  # => true
  ```

  """
  @spec contain?(aspects :: list() | map(), name :: binary(), value :: binary()) :: boolean() | map()
  def contain?(aspects, name, value) when is_map(aspects), do: prismify(aspects, name, value, &contain?/3)
  def contain?(aspects, name, value) do
    aspects
    |> Enum.any?(fn a -> a.name == name && Enum.any?(a.values, fn v -> v == value end) end)
  end

  @doc """
  Lists all attribute values for the specified attribute name

  The results are sorted and each value is unique.

  ```
  SmeeView.EntityAttributes.values_for(ent_attrs, "urn:oasis:names:tc:SAML:attribute:assurance-certification")
  # => ["http://refeds.org/sirtfi", "http://www.swamid.se/policy/assurance/al1",
  # "https://refeds.org/sirtfi", "https://refeds.org/sirtfi2"]
  ```

  """
  @spec values_for(aspects :: list() | map(), name :: binary()) :: list() | map()
  def values_for(aspects, name) when is_map(aspects), do: prismify(aspects, name, &values_for/2)
  def values_for(aspects, name) do
    aspects
    |> Enum.filter(fn aspect -> aspect.name == name end)
    |> Enum.map(
         fn aspect ->
           aspect.values
         end
       )
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sort()
  end

  @doc """
  Returns a list of all attribute names.

  The results are sorted and each value is unique.

  ```
  SmeeView.EntityAttributes.names(ent_attrs)
  # => ["http://kafe.kreonet.net/jurisdiction", "http://macedir.org/entity-category",
  # "http://macedir.org/entity-category-support",
  # "https://federation.renater.fr/member-of",
  # "urn:oasis:names:tc:SAML:attribute:assurance-certification",
  # "urn:oasis:names:tc:SAML:profiles:subject-id:req",
  # "urn:oid:2.16.756.1.2.5.1.1.4", "urn:oid:2.16.756.1.2.5.1.1.5"]
  ```

  """
  @spec names(aspects :: list() | map()) :: list() | map()
  def names(aspects) when is_map(aspects), do: prismify(aspects, &names/1)
  def names(aspects) do
    aspects
    |> Enum.map(
         fn aspect ->
           aspect.name
         end
       )
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sort()
  end

  @doc """
  Returns a list of all attribute values - every value for every attribute.

  The results are sorted and each value is unique.

  ```
  SmeeView.EntityAttributes.values(ent_attrs)
  # => ["KR", "any", "hospital",  "http://aai.dfn.de/category/bwidm-member",
  # "http://aai.dfn.de/category/campus-lsa-member",
  # "http://clarin.eu/category/clarin-member", "http://eduid.cz/uri/group/mefanet",
  # "http://refeds.org/category/hide-from-discovery",
  # "http://refeds.org/category/research-and-scholarship", ...]
  ```

  """
  @spec values(aspects :: list() | map()) :: list() | map()
  def values(aspects) when is_map(aspects), do: prismify(aspects, &values/1)
  def values(aspects) do
    aspects
    |> Enum.map(
         fn aspect ->
           aspect.values
         end
       )
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sort()
  end

  @doc """
  Lists the values for `urn:oasis:names:tc:SAML:attribute:assurance-certification` entity attributes

  ```
  SmeeView.EntityAttributes.assurance_certifications(ent_attrs)
  # => ["http://refeds.org/sirtfi", "http://www.swamid.se/policy/assurance/al1",
  # "https://refeds.org/sirtfi2"]
  ```

  """
  @spec assurance_certifications(aspects :: list() | map()) :: list() | map()
  def assurance_certifications(aspects) when is_map(aspects), do: prismify(aspects, &assurance_certifications/1)
  def assurance_certifications(aspects) do
    aspects
    |> values_for("urn:oasis:names:tc:SAML:attribute:assurance-certification")
  end

  @doc """
  Lists all values for entity category (`http://macedir.org/entity-category`) entity attributes

  ```
  SmeeView.EntityAttributes.entity_categories(ent_attrs)
  # => ["http://aai.dfn.de/category/bwidm-member",
  # "http://eduid.cz/uri/idp-group/university",
  # "http://refeds.org/category/hide-from-discovery",
  # "http://refeds.org/category/research-and-scholarship",
  # "http://www.geant.net/uri/dataprotection-code-of-conduct/v1",
  # "https://edugate.heanet.ie/rr3/p/page/HEAnetInternalEC",
  # "https://federation.renater.fr/category/collaboratif",
  # "https://myacademicid.org/entity-categories/esi",
  # "https://refeds.org/category/anonymous",
  # "https://refeds.org/category/code-of-conduct/v2",
  # "https://refeds.org/category/hide-from-discovery",
  # "https://refeds.org/category/personalized",
  # ... ]
  ```

  """
  @spec entity_categories(aspects :: list() | map()) :: list() | map()
  def entity_categories(aspects) when is_map(aspects), do: prismify(aspects, &entity_categories/1)
  def entity_categories(aspects) do
    aspects
    |> values_for("http://macedir.org/entity-category")
  end

  @doc """
  Lists all values for entity category support attributes (`http://macedir.org/entity-category-support`)

  ```
  SmeeView.EntityAttributes.supports_entity_categories(ent_attrs)
  # => ["http://clarin.eu/category/clarin-member",
  # "http://refeds.org/category/research-and-scholarship",
  # "http://www.geant.net/uri/dataprotection-code-of-conduct/v1",
  # "https://idp.lit.ie/saml2", "https://login.dcu.ie",
  # "https://myacademicid.org/entity-categories/esi",
  # "https://refeds.org/category/anonymous",
  # "https://refeds.org/category/code-of-conduct/v2",
  # "https://refeds.org/category/personalized", "https://refeds.org/sirtfi"]
  ```

  """
  @spec supports_entity_categories(aspects :: list() | map()) :: list() | map()
  def supports_entity_categories(aspects) when is_map(aspects), do: prismify(aspects, &supports_entity_categories/1)
  def supports_entity_categories(aspects) do
    aspects
    |> values_for("http://macedir.org/entity-category-support")
  end

  @doc """
  Returns true if any of the attributes contains the entity category

  ```
  SmeeView.EntityAttributes.category?(ent_attrs, "https://myacademicid.org/entity-categories/esi")
  # => false
  ```

  """
  @spec category?(aspects :: list() | map(), category :: binary()) :: boolean() | map()
  def category?(aspects, category) when is_map(aspects), do: prismify(aspects, category, &category?/2)
  def category?(aspects, category) do
    aspects
    |> entity_categories()
    |> Enum.member?(category)
  end

  @doc """
  Returns true if any of the attributes show support for the specified entity category

  ```
  SmeeView.EntityAttributes.supports?(ent_attrs, "https://refeds.org/category/anonymous")
  # => false
  ```

  """
  @spec supports?(aspects :: list() | map(), category :: binary()) :: boolean() | map()
  def supports?(aspects, category) when is_map(aspects), do: prismify(aspects, category, &supports?/2)
  def supports?(aspects, category) do
    aspects
    |> supports_entity_categories()
    |> Enum.member?(category)
  end

  @doc """
  Returns true if any of the attributes indicate Research And Scholarship status

  ```
  SmeeView.EntityAttributes.ras?(ent_attrs)
  # => true
  ```

  """
  @spec ras?(aspects :: list() | map()) :: boolean() | map()
  def ras?(aspects) when is_map(aspects), do: prismify(aspects, &ras?/1)
  def ras?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "http://refeds.org/category/research-and-scholarship")
  end

  @doc """
  Returns true if any of the attributes indicate SIRTFI status

  ```
  SmeeView.EntityAttributes.sirtfi?(ent_attrs)
  # => false
  ```

  """
  @spec sirtfi?(aspects :: list() | map()) :: boolean() | map()
  def sirtfi?(aspects) when is_map(aspects), do: prismify(aspects, &sirtfi?/1)
  def sirtfi?(aspects) do
    aspects
    |> contain?("urn:oasis:names:tc:SAML:attribute:assurance-certification", "https://refeds.org/sirtfi")
  end

  @doc """
  Returns true if any of the attributes indicate CoCo (Code of Conduct) status


  ```
  SmeeView.EntityAttributes.coco?(ent_attrs)
  # => true
  ```

  """
  @spec coco?(aspects :: list() | map()) :: boolean() | map()
  def coco?(aspects) when is_map(aspects), do: prismify(aspects, &coco?/1)
  def coco?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "https://refeds.org/category/code-of-conduct/v2")
  end

  @doc """
  Returns true if any of the attributes indicate Hide From Discovery status

  ```
  SmeeView.EntityAttributes.hide?(ent_attrs)
  # => true
  ```

  """
  @spec hide?(aspects :: list() | map()) :: boolean() | map()
  def hide?(aspects) when is_map(aspects), do: prismify(aspects, &hide?/1)
  def hide?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "http://refeds.org/category/hide-from-discovery")
  end

  @doc """
  Lists all nameid types marked as required with the `urn:oasis:names:tc:SAML:profiles:subject-id:req` attribute

  ```
  SmeeView.EntityAttributes.required_subject_ids(ent_attrs)
  # => ["pairwise-id", "subject-id"]
  ```

  """
  @spec required_subject_ids(aspects :: list() | map()) :: list() | map()
  def required_subject_ids(aspects) when is_map(aspects), do: prismify(aspects, &required_subject_ids/1)
  def required_subject_ids(aspects) do
    aspects
    |> values_for("urn:oasis:names:tc:SAML:profiles:subject-id:req")
  end

  #######################################################################################

  defp entity_xmap do
    @entity_xmap
  end

  defp preprocess(role, attributes) do

    attrs = attributes
            |> Enum.map(fn m -> {m[:name], m[:values] || []} end)
            |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, Map.get(acc, k, []) ++ v) end)
            |> Enum.map(fn {k, v} -> %{name: k, values: Enum.uniq(v)} end)
            |> Apex.ap()

    {role, attrs}
  end

end
