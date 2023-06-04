defmodule SmeeView.RequestedAttributes do

  @moduledoc """
  This module can extracts the `<RequestedAttribute>` elements in entity metadata as "aspect" structs, and then
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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.RequestedAttribute, roles: false, features: [:attr]

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService/RequestedAttribute"le,
    friendly_name: ~x"string(@FriendlyName)"s,
    name: ~x"string(@Name)"s,
    name_format: ~x"string(@NameFormat)"s,
    required: ~x"string(@isRequired)"s,

  ]

  defp entity_xmap do
    @entity_xmap
  end

  @doc """
  Returns only required attributes

  Filters the view (list) or prism (map) to only include required attributes

  ```
  SmeeView.RequestedAttributes.required_filter(aspects)
  # =>  [%SmeeView.Aspect.RequestedAttribute{}, %SmeeView.Aspect.RequestedAttribute{}]
  ```

  """
  @spec required_filter(aspects :: list() | map()) :: list()
  def required_filter(prism) when is_map(prism), do: prismify(prism, &required_filter/1)
  def required_filter(aspects) do
    aspects
    |> Enum.filter(
         fn aspect ->
           SmeeView.Aspects.RequestedAttribute.required?(aspect)
         end
       )
  end

  @doc """
  Returns only optional attributes

  Filters the view (list) or prism (map) to only include required attributes

  ```
  SmeeView.RequestedAttributes.optional_filter(aspects)
  # =>  [%SmeeView.Aspect.RequestedAttribute{}, %SmeeView.Aspect.RequestedAttribute{}]
  ```

  """
  @spec optional_filter(aspects :: list() | map()) :: list()
  def optional_filter(prism) when is_map(prism), do: prismify(prism, &optional_filter/1)
  def optional_filter(aspects) do
    aspects
    |> Enum.filter(
         fn aspect ->
           SmeeView.Aspects.RequestedAttribute.optional?(aspect)
         end
       )
  end

  #######################################################################################

end
