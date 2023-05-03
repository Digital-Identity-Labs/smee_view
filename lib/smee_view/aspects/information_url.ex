defmodule SmeeView.Aspects.InformationURL do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :url]


end

defimpl String.Chars, for: SmeeView.Aspects.InformationURL do
  def to_string(a), do: a.url
end
