defmodule SmeeView.SingleLogoutServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SingleLogoutService, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/SingleLogoutService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]
  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
