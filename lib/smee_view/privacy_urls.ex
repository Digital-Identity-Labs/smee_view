defmodule SmeeView.PrivacyURLs do

  @moduledoc """
  This module can extracts the `<ArtifactResolutionService>` elements in entity metadata as "aspect" structs, and then
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
