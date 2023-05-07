defmodule SmeeView.AttributeConsumingServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AttributeConsumingService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService"le,
    default: ~x"string(@isDefault)"s,
    index: ~x"string(@index)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, role) do
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
