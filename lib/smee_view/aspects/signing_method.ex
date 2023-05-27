defmodule SmeeView.Aspects.SigningMethod do

  @moduledoc """
  Represents and processes <alg:SigningMethod> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               algorithm: binary()
             }

  @derive Jason.Encoder
  defstruct [
    algorithm: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:algo]

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.SigningMethod do
@moduledoc false
  def to_string(a), do: a.algorithm
end
