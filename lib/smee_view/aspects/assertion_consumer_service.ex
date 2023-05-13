defmodule SmeeView.Aspects.AssertionConsumerService do

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

  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end


end

defimpl String.Chars, for: SmeeView.Aspects.AssertionConsumerService do
  def to_string(a), do: a.location
end
