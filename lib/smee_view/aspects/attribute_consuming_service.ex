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

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AttributeConsumingService do
  def to_string(a), do: a.location
end
