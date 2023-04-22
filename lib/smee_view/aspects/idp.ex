defmodule SmeeView.Aspects.IdP do
  alias __MODULE__
  alias Smee.Entity

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
        protocols: parse_protocols(data[:protocols]),
        want_authn_requests_signed: parse_boolean(data[:want_authn_requests_signed])
      }
    )
    struct(%IdP{}, data)
  end

  #######################################################################################


  ## Move to Utils?
  defp parse_protocols(words) when is_nil(words) do
    []
  end

  defp parse_protocols(words) when is_list(words) do
    words
  end

  defp parse_protocols(words) when is_binary(words) do
    words
    |> String.split(" ")
  end

  defp parse_boolean(value) do
    case value do
      "TRUE" -> true
      "true" -> true
      "1" -> true
      1 -> true
      _ -> false
    end
  end

end
