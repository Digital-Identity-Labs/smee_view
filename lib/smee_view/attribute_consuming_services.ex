defmodule SmeeView.AttributeConsumingServices do

  @moduledoc """
  This module can extracts the `<AttributeConsumingService>` elements in entity metadata as "aspect" structs, and then
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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AttributeConsumingService, roles: false, features: []

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService"le,
    default: ~x"string(@isDefault)"s,
    index: ~x"string(@index)"s,
  ]

  ## BESPOKE

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, _role) do
    Map.merge(
      aspect_data,
      %{
        requested_attributes: SmeeView.RequestedAttributes.view(entity, :sp),
        service_descriptions: SmeeView.ServiceDescriptions.view(entity, :sp),
        service_names: SmeeView.ServiceNames.view(entity, :sp)
      }
    )
  end

  #######################################################################################

end
