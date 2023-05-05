defmodule SmeeView.Aspects.IdP do

  alias __MODULE__
  alias SmeeView.Utils

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
    services: [],
    attributes: []
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################

  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        want_authn_requests_signed: Utils.parse_boolean(data[:want_authn_requests_signed])
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.IdP do
  def to_string(a), do: "IdP"
end
