defmodule SmeeView.IdP do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.IdP, roles: false, one: true

  @entity_xmap [
    ~x"//md:IDPSSODescriptor"l,
    protocols: ~x"string(@protocolSupportEnumeration)"s,
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
        keywords: SmeeView.Keywords.view(entity, :idp),
        keys: SmeeView.Keys.view(entity, :idp),
        nameid_formats: SmeeView.NameIDFormats.view(entity, :idp),
        services:  SmeeView.services(entity, :idp),
      }
    )
  end

end
