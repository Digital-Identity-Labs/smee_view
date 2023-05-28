defmodule SmeeView.Keys do

  @moduledoc """
  This module can extracts the `<KeyDescriptor>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

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
