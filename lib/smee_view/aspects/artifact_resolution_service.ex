defmodule SmeeView.Aspects.ArtifactResolutionService do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  defstruct [
    binding: nil,
    location: nil,
    index: nil
  ]

  use SmeeView.Aspects.AspectCommon

end


defimpl String.Chars, for: SmeeView.Aspects.ArtifactResolutionService do
  def to_string(a), do: a.location
end
