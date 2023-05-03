defmodule SmeeView.Aspects.ServiceName do

  alias __MODULE__
  alias SmeeView.Utils



  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]


end

defimpl String.Chars, for: SmeeView.Aspects.ServiceName do
  def to_string(a), do: a.text
end
