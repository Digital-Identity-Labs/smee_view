defmodule SmeeView.Keys do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Key, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:KeyDescriptor"el,
    pem: ~x"string(//ds:X509Certificate)"s,
    names: ~x"string(//ds:KeyName)"ls,
    use: ~x"string(/*/@use)"s,
    subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
    algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:KeyDescriptor"el,
    pem: ~x"string(//ds:X509Certificate)"s,
    names: ~x"string(//ds:KeyName)"ls,
    use: ~x"string(/*/@use)"s,
    subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
    algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end

end
