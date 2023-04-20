defmodule SmeeView.Logos do

  use SmeeView.View, aspect: SmeeView.Aspects.Logo, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
    url: ~x"./text()"s,
    height: ~x"string(/*/@height)"i,
    width: ~x"string(/*/@width)"i,
    lang: ~x"@xml:lang"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
    url: ~x"./text()"s,
    height: ~x"string(/*/@height)"i,
    width: ~x"string(/*/@width)"i,
    lang: ~x"@xml:lang"s
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end

end
