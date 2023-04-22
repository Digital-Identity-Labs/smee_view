defmodule SmeeView.Aspects.ArtifactResolutionService do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    binding: nil,
    location: nil,
    index: nil
  ]

  def new(data, options \\ []) do
    struct(%ArtifactResolutionService{}, data)
  end

end
