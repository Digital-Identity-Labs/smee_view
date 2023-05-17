defmodule SmeeView.Aspects.AttributeConsumingService do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               default: boolean(),
               index: integer(),
               requested_attributes: list(),
               service_descriptions: list(),
               service_names: list()
             }

  defstruct [
    default: false,
    index: 1,
    requested_attributes: [],
    service_descriptions: [],
    service_names: []
  ]

  use SmeeView.Aspects.AspectCommon, features: []

  ## BESPOKE

  @doc "Returns the index type for this endpoint/service"
  @spec index(aspect ::  __MODULE__.t()) :: integer()
  def index(%{index: index}) do
    index
  end

  def index(aspect) do
    0
  end

  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AttributeConsumingService do
  def to_string(a), do: "Attribute Consuming Service #{a.index}"
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AttributeConsumingService do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:service_names ,:service_descriptions, :requested_attributes, :index, :default])
      |> Map.merge(%{st: "attribute_consuming_service"}),
      opts
    )
  end
end
