defmodule SmeeView.Aspects.EntityAttribute do

  @moduledoc """
  Represents and processes <EntityAttribute> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
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

end

defimpl String.Chars, for: SmeeView.Aspects.EntityAttribute do
  def to_string(a), do: a.values
                        |> Enum.join("; ")
end
