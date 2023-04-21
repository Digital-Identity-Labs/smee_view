defmodule SmeeView.Scopes do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Scope, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/shibmd:Scope"le,
    regex: ~x"string(@regexp)"s,
    domain: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################


end
