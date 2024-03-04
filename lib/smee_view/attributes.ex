defmodule SmeeView.Attributes do

  @moduledoc """
  This module can extracts the `<saml:Attribute>` elements in entity metadata as "aspect" structs, and then
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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Attribute, roles: false, features: [:attr]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/saml:Attribute"el,
    friendly_name: ~x"string(@FriendlyName)"s,
    name: ~x"string(@Name)"s,
    name_format: ~x"string(@NameFormat)"s,
    values: ~x"string(saml:AttributeValue)"ls
  ]

  defp entity_xmap do
    @entity_xmap
  end

#  defp preprocess(role, attributes) do
#
#    attrs = attributes
#            |> Enum.map(fn m -> {m[:name], m[:values] || []} end)
#            |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, Map.get(acc, k, []) ++ v) end)
#            |> Enum.map(fn {k, v} -> %{name: k, values: Enum.uniq(v)} end)
#            |> Apex.ap()
#
#    {role, attrs}
#  end

end
