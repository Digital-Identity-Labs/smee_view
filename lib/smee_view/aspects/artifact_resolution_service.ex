defmodule SmeeView.Aspects.ArtifactResolutionService do

  @moduledoc """
  Represents and processes <ArtifactResolutionService> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

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
    index: 1
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.ArtifactResolutionService do
  def to_string(a), do: a.location
end

defimpl Jason.Encoder, for: SmeeView.Aspects.ArtifactResolutionService do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "artifact_resolution_service"}),
      opts
    )
  end
end
