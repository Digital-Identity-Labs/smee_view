defmodule SmeeView.EntityAttributes do

  @moduledoc """
  This module can extracts the `<mdattr:EntityAttributes>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

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

  @spec contain?(aspects :: list() | map(), name:: binary()) :: list() | map()
  def contain?(aspects, name) when is_map(aspects), do: prismify(aspects, name, &contain?/2)
  def contain?(aspects, name) do
    aspects
    |> Enum.any?(fn a -> a.name == name end)
  end

  @spec contain?(aspects :: list() | map(), name:: binary(), value :: binary()) :: list() | map()
  def contain?(aspects, name, value) when is_map(aspects), do: prismify(aspects, name, value, &contain?/3)
  def contain?(aspects, name, value) do
    aspects
    |> Enum.any?(fn a -> a.name == name && Enum.any?(a.values, fn v -> v == value end) end)
  end

  @spec values_for(aspects :: list() | map(), name:: binary()) :: list() | map()
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

  @spec assurance_certifications(aspects :: list() | map()) :: list() | map()
  def assurance_certifications(aspects) when is_map(aspects), do: prismify(aspects, &assurance_certifications/1)
  def assurance_certifications(aspects) do
    aspects
    |> values_for("urn:oasis:names:tc:SAML:attribute:assurance-certification")
  end

  @spec entity_categories(aspects :: list() | map()) :: list() | map()
  def entity_categories(aspects) when is_map(aspects), do: prismify(aspects, &entity_categories/1)
  def entity_categories(aspects) do
    aspects
    |> values_for("http://macedir.org/entity-category")
  end

  @spec supports_entity_categories(aspects :: list() | map()) :: list() | map()
  def supports_entity_categories(aspects) when is_map(aspects), do: prismify(aspects, &supports_entity_categories/1)
  def supports_entity_categories(aspects) do
    aspects
    |> values_for("http://macedir.org/entity-category-support")
  end

  @spec category?(aspects :: list() | map(), category :: binary()) :: list() | map()
  def category?(aspects, category) when is_map(aspects), do: prismify(aspects, category, &category?/2)
  def category?(aspects, category) do
    aspects
    |> entity_categories()
    |> Enum.member?(category)
  end

  @spec supports?(aspects :: list() | map(), category :: binary()) :: list() | map()
  def supports?(aspects, category) when is_map(aspects), do: prismify(aspects, category, &supports?/2)
  def supports?(aspects, category) do
    aspects
    |> supports_entity_categories()
    |> Enum.member?(category)
  end

  @spec ras?(aspects :: list() | map()) :: list() | map()
  def ras?(aspects) when is_map(aspects), do: prismify(aspects, &ras?/1)
  def ras?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "http://refeds.org/category/research-and-scholarship")
  end

  @spec sirtfi?(aspects :: list() | map()) :: list() | map()
  def sirtfi?(aspects) when is_map(aspects), do: prismify(aspects, &sirtfi?/1)
  def sirtfi?(aspects) do
    aspects
    |> contain?("urn:oasis:names:tc:SAML:attribute:assurance-certification", "https://refeds.org/sirtfi")
  end

  @spec coco?(aspects :: list() | map()) :: list() | map()
  def coco?(aspects) when is_map(aspects), do: prismify(aspects, &coco?/1)
  def coco?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "https://refeds.org/category/code-of-conduct/v2")
  end

  @spec hide?(aspects :: list() | map()) :: list() | map()
  def hide?(aspects) when is_map(aspects), do: prismify(aspects, &hide?/1)
  def hide?(aspects) do
    aspects
    |> contain?("http://macedir.org/entity-category", "http://refeds.org/category/hide-from-discovery")
  end

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

end
