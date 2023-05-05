defmodule SmeeView.Protocols do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Protocol, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor"l,
    uri: ~x"string(@protocolSupportEnumeration)"s,
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor"l,
    uri: ~x"string(@protocolSupportEnumeration)"s,
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end


  #######################################################################################

end
