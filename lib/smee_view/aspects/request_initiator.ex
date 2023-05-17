defmodule SmeeView.Aspects.RequestInitiator do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               binding: binary(),
               location: binary(),
               index: integer()
             }

  defstruct [
    binding: nil,
    location: nil,
    index: 1
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.RequestInitiator do
  def to_string(a), do: a.location
end

defimpl Jason.Encoder, for: SmeeView.Aspects.RequestInitiator do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "request_initiator"}),
      opts
    )
  end
end
