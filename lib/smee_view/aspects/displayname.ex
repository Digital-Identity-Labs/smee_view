defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias SmeeView.Utils


  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]

end

defimpl String.Chars, for: SmeeView.Aspects.Displayname do
  def to_string(a), do: a.text
end
