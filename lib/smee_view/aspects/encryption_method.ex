defmodule SmeeView.Aspects.EncryptionMethod do

  @moduledoc """
  Represents and processes <EncryptionMethod> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

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

