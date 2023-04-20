defmodule SmeeView.Displaynames do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Displayname, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:DisplayName"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:DisplayName"el,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end

end
