defmodule SmeeView.Aspects.ArtifactResolutionService do

  alias __MODULE__
  alias SmeeView.Utils


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


defimpl String.Chars, for: SmeeView.Aspects.ArtifactResolutionService do
  def to_string(a), do: a.location
end
