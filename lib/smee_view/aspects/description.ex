defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]

end

defimpl String.Chars, for: SmeeView.Aspects.Description do
  def to_string(a), do: a.text
end
