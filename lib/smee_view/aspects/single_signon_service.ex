defmodule SmeeView.Aspects.SingleSignonService do

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
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: 0})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.SingleSignonService do
  def to_string(a), do: a.location
end
