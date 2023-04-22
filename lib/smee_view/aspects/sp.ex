defmodule SmeeView.Aspects.SP do
  alias __MODULE__
  alias Smee.Entity

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
        protocols: parse_protocols(data[:protocols]),
        authn_requests_signed: parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: parse_boolean(data[:want_assertions_signed])
      }
    )
    struct(%SP{}, data)
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
