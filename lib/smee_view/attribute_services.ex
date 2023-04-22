defmodule SmeeView.Aspects.AttributeServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AttributeService, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/AttributeService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
