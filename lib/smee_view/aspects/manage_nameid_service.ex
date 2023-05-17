defmodule SmeeView.Aspects.ManageNameidService do

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
    index: 0
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  ## Does not, cannot, have index - just here for indexing consistency
  @spec prepare_data(data :: map() | keyword(), options :: keyword()) :: map()
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: 0})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.ManageNameidService do
  def to_string(a), do: a.location
end

defimpl Jason.Encoder, for: SmeeView.Aspects.ManageNameidService do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index,])
      |> Map.merge(%{st: "manage_nameid_service"}),
      opts
    )
  end
end
