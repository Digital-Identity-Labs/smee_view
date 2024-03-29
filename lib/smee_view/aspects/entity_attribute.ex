defmodule SmeeView.Aspects.EntityAttribute do

  @moduledoc """
  Represents and processes <mdattr:EntityAttributes> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


  alias SmeeView.Utils

  @type t :: %__MODULE__{
               name: binary(),
               values: list()
             }


  @derive Jason.Encoder
  defstruct [
    name: nil,
    values: []
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(data, %{values: Utils.parse_attr_values(data[:values])})
  end

end


