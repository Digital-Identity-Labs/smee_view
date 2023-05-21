defmodule SmeeView.Aspects.AssertionIDRequestService do

  @moduledoc """
  Represents and processes <AssertionIDRequestService> elements in entity metadata as Aspect structs.

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
    index: 0
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

  #######################################################################################

  ## Does not, cannot, have index - just here for indexing consistency
  #@spec is not needed
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: 0})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AssertionIDRequestService do
  def to_string(a), do: a.location
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AssertionIDRequestService do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "assertion_id_request_service"}),
      opts
    )
  end
end
