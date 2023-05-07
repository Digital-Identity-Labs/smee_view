defmodule SmeeView.AssertionIDRequestServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AssertionIDRequestService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/AssertionIDRequestService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
