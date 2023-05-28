defmodule SmeeView.SPs do

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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SP, roles: false, one: true

  @entity_xmap [
    ~x"//md:SPSSODescriptor"l,
    authn_requests_signed: ~x"string(@AuthnRequestsSigned)"s,
    want_assertions_signed: ~x"string(@WantAssertionsSigned)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, role) do
    Map.merge(
      aspect_data,
      %{
        logos: SmeeView.Logos.view(entity, :sp),
        privacy_urls: SmeeView.PrivacyURLs.view(entity, :sp),
        information_urls: SmeeView.InformationURLs.view(entity, :sp),
        protocols: SmeeView.Protocols.view(entity, :sp),
        displaynames: SmeeView.Displaynames.view(entity, :sp),
        keywords: SmeeView.Keywords.view(entity, :sp),
        keys: SmeeView.Keys.view(entity, :sp),
        services: services(entity, :sp),
        request_initiators: SmeeView.RequestInitiators.view(entity, :sp),
        discovery_responses: SmeeView.DiscoveryResponses.view(entity, :sp),
      }
    )
  end

end
