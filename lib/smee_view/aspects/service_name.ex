defmodule SmeeView.Aspects.ServiceName do

  @moduledoc """
  Represents and processes <ServiceName> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  @type t :: %__MODULE__{
               lang: binary(),
               text: binary()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]

  #######################################################################################

end

