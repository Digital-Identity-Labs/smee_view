defmodule SmeeView.Aspects.OrganizationURL do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils


  @type t :: %__MODULE__{
               lang: binary(),
               url: binary()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :url]

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.OrganizationURL do
  def to_string(a), do: a.url
end
