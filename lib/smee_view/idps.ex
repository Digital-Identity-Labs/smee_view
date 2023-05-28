defmodule SmeeView.IdPs do

  @moduledoc """
  This module can extracts a bundle of aspects from the IdP role in a SAML entity's metadata.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.IdP, roles: false, one: true

  @entity_xmap [
    ~x"//md:IDPSSODescriptor"l,
    want_authn_requests_signed: ~x"string(@WantAuthnRequestsSigned)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, role) do
    Map.merge(
      aspect_data,
      %{
        scopes: SmeeView.Scopes.view(entity, :idp),
        logos: SmeeView.Logos.view(entity, :idp),
        displaynames: SmeeView.Displaynames.view(entity, :idp),
        networks: SmeeView.Networks.view(entity, :idp),
        geolocations: SmeeView.Geolocations.view(entity, :idp),
        domains: SmeeView.Domains.view(entity, :idp),
        privacy_urls: SmeeView.PrivacyURLs.view(entity, :idp),
        information_urls: SmeeView.InformationURLs.view(entity, :idp),
        keywords: SmeeView.Keywords.view(entity, :idp),
        keys: SmeeView.Keys.view(entity, :idp),
        nameid_formats: SmeeView.NameIDFormats.view(entity, :idp),
        protocols: SmeeView.Protocols.view(entity, :idp),
        services:  services(entity, :idp),
        attributes:  SmeeView.Attributes.view(entity, :idp),
      }
    )
  end



end
