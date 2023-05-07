defmodule SmeeView.RequestInitiators do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.RequestInitiator, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:SPSSODescriptor/Extensions/init:RequestInitiator"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
