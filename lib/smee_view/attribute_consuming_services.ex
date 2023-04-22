defmodule SmeeView.AttributeConsumingServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AttributeConsumingService, roles: false

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService"le,
    default: ~x"string(@isDefault)"s,
    index: ~x"string(@index)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
