defmodule SmeeView.Aspects.ManageNameidService do

  @moduledoc """
  Represents and processes <ManageNameidService> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

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

  ######################################################

  ## Does not, cannot, have index - just here for indexing consistency
  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(data, %{index: 0})
  end

end



