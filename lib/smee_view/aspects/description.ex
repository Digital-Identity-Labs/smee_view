defmodule SmeeView.Aspects.Description do

  @moduledoc """
  Represents and processes <Description> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               lang: binary(),
               text: binary(),
               role: atom()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    text: nil,
    role: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text], roles: true

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Description do
  def to_string(a), do: a.text
end
