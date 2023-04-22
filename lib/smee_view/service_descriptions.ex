defmodule SmeeView.ServiceDescriptions do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Description, roles: false

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AttributeConsumingService/ServiceDescription"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end


end
