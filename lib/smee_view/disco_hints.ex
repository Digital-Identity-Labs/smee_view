defmodule SmeeView.DiscoHints do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.DiscoHints, roles: false, one: true

  @entity_xmap [
    ~x"//md:Extensions"l,
    exists: ~x"/"
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, _role) do
    Map.merge(
      aspect_data,
      %{
        scopes: SmeeView.Scopes.view(entity, :idp),
        networks: SmeeView.Networks.view(entity, :idp),
        geolocations: SmeeView.Geolocations.view(entity, :idp),
        keywords: SmeeView.Keywords.view(entity, :idp),
        domains: SmeeView.Domains.view(entity, :idp)
      }
    )
  end

end
