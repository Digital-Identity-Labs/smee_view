defmodule SmeeView.Aspects.SP do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    protocols: [],
    authn_requests_signed: false,
    want_assertions_signed: false,
    logos: [],
    displaynames: [],
    keywords: [],
    keys: [],
    services: []
  ]

  def new(data, options \\ []) do
    data = Map.merge(
      data,
      %{
        protocols: Utils.parse_protocols(data[:protocols]),
        authn_requests_signed: Utils.parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: Utils.parse_boolean(data[:want_assertions_signed])
      }
    )
    struct(%SP{}, data)
  end

  #######################################################################################

  
end
