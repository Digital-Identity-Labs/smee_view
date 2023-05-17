defmodule SmeeView.Aspects.Organization do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               displaynames: list(),
               names: list(),
               urls: list(),
             }

  @derive Jason.Encoder
  defstruct [
    displaynames: [],
    names: [],
    urls: []
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.DiscoHints do
  def to_string(a), do: "Organization"
end
