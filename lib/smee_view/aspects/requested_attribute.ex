defmodule SmeeView.Aspects.RequestedAttribute do

  @moduledoc """
  Represents and processes <RequestedAttribute> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               friendly_name: binary(),
               name: binary(),
               name_format: binary()
             }

  @derive Jason.Encoder
  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:attr]

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.RequestedAttribute do
  def to_string(a), do: a.friendly_name
end
