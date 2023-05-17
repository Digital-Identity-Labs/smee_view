defmodule SmeeView.Aspects.DiscoHints do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               scopes: list(),
               networks: list(),
               geolocations: list(),
               keywords: list(),
               domains: list(),
             }

  @derive Jason.Encoder
  defstruct [
    scopes: [],
    networks: [],
    geolocations: [],
    keywords: [],
    domains: [],
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Organization do
  def to_string(a), do: "Disco Hints"
end
