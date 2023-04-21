defmodule SmeeView.Aspects.IdP do
  alias __MODULE__
  alias Smee.Entity

  defstruct [
    protocols: [],
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
    data = Map.merge(data, %{protocols: parse_protocols(data[:protocols])})
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


end
