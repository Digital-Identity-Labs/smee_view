defmodule SmeeView.ServiceNames do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Displayname, roles: false

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService/ServiceName"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
