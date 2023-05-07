defmodule SmeeView.Aspects.DiscoUI do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    displaynames: [],
    names: [],
    logos: [],
    privacy_urls: [],
    information_urls: [],
    keywords: [],
    organization: [],
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.DiscoUI do
  def to_string(a), do: "Disco UI"
end
