defmodule SmeeView.Aspects.ManageNameidServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.ManageNameidService, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/ManageNameIDService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
