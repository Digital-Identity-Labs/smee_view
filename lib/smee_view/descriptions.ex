defmodule SmeeView.Descriptions do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Description, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Description"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Description"el,
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
