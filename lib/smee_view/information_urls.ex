defmodule SmeeView.InformationURLs do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.InformationURL, roles: true, features: [:url, :lang]

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:InformationURL"le,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:InformationURL"el,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end

end
