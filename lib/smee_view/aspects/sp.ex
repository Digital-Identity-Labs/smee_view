defmodule SmeeView.Aspects.SP do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


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

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        protocols: Utils.parse_protocols(data[:protocols]),
        authn_requests_signed: Utils.parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: Utils.parse_boolean(data[:want_assertions_signed])
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.SP do
  def to_string(a), do: "SP"
end
