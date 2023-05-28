defmodule SmeeView.Aspects.AssertionConsumerService do

  @moduledoc """
  Represents and processes <AssertionConsumerService> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               binding: binary(),
               location: binary(),
               index: integer(),
               default: boolean()
             }

  defstruct [
    binding: nil,
    location: nil,
    index: 1,
    default: false
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AssertionConsumerService do
@moduledoc false
  def to_string(a), do: a.location
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AssertionConsumerService do
@moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index, :default])
      |> Map.merge(%{st: "assertion_consumer_service"}),
      opts
    )
  end
end
