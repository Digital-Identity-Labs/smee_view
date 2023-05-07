defmodule SmeeView.Aspects.AttributeService do

  alias __MODULE__
  alias SmeeView.Utils


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

defimpl String.Chars, for: SmeeView.Aspects.AttributeService do
  def to_string(a), do: a.location
end
