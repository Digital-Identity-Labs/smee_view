defmodule SmeeView.RegistrationPolicies do

  @moduledoc """
  This module can extracts the `<<mdrpi:RegistrationPolicy>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.

  * [SAML V2.0 Metadata Extensions for Registration and Publication Information](http://docs.oasis-open.org/security/saml/Post2.0/saml-metadata-rpi/v1.0/cs01/saml-metadata-rpi-v1.0-cs01.html)

  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.RegistrationPolicy, roles: false

  @entity_xmap [
    ~x"//md:Extensions/mdrpi:RegistrationInfo/mdrpi:RegistrationPolicy"le,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
