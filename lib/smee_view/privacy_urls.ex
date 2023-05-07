defmodule SmeeView.PrivacyURLs do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.PrivacyURL, roles: true, features: [:url, :lang]

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:PrivacyURL"le,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:PrivacyURL"el,
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
