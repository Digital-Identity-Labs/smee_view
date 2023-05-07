defmodule SmeeView.SingleSignonServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SingleSignonService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/SingleSignOnService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
