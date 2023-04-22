defmodule SmeeView.RequestedAttributes do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.RequestedAttribute, roles: false

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService/RequestedAttribute"le,
    friendly_name: ~x"string(@FriendlyName)"s,
    name: ~x"string(@Name)"s,
    name_format: ~x"string(@NameFormat)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
