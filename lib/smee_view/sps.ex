defmodule SmeeView.SPs do

  @moduledoc """
  This module can extracts a bundle of aspects from the IdP role in a SAML entity's metadata.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

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
    error_url: ~x"string(@errorURL)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, _role) do
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

  @spec services(entity :: Smee.Entity.t() | list(), role :: atom(), options :: Keyword.t()) :: list()
  defp services(entity, _role, options \\ []) do
    [
      SmeeView.ArtifactResolutionServices.view(entity, :sp, options),
      SmeeView.AttributeConsumingServices.view(entity, :sp, options),
      SmeeView.AssertionConsumerServices.view(entity, :sp, options),
      SmeeView.ManageNameidServices.view(entity, :sp, options)
    ]
    |> List.flatten()
  end

end
