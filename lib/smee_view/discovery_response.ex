defmodule SmeeView.DiscoveryResponses do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.DiscoveryResponse, roles: false

  @entity_xmap [
    ~x"//md:SPSSODescriptor/Extensions/idpdisc:DiscoveryResponse"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end
  #######################################################################################

end
