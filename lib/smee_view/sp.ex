defmodule SmeeView.SP do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SP, roles: false, one: true

  @entity_xmap [
    ~x"//md:SPSSODescriptor"l,
    protocols: ~x"string(@protocolSupportEnumeration)"s,
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
        displaynames: SmeeView.Displaynames.view(entity, :sp),
        keywords: SmeeView.Keywords.view(entity, :sp),
        keys: SmeeView.Keys.view(entity, :sp),
        services: SmeeView.services(entity, :sp),
        request_initiators: SmeeView.RequestInitiators.view(entity, :sp),
        discovery_responses: SmeeView.DiscoveryResponses.view(entity, :sp),
      }
    )
  end

end
