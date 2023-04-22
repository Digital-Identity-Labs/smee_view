defmodule SmeeView.Aspects.IdP do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    protocols: [],
    want_authn_requests_signed: false,
    scopes: [],
    logos: [],
    displaynames: [],
    networks: [],
    geolocations: [],
    domains: [],
    keywords: [],
    keys: [],
    nameid_formats: [],
    services: []
  ]

  def new(data, options \\ []) do
    data = Map.merge(
      data,
      %{
        protocols: Utils.parse_protocols(data[:protocols]),
        want_authn_requests_signed: Utils.parse_boolean(data[:want_authn_requests_signed])
      }
    )
    struct(%IdP{}, data)
  end

  #######################################################################################



end
