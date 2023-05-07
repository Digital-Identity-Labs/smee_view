defmodule SmeeView.NameidMappingServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.NameidMappingService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/NameIDMappingService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
