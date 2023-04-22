defmodule SmeeView.Aspects.SingleSignonServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SingleSignonService, roles: false

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
