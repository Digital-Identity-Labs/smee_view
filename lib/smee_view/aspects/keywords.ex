defmodule SmeeView.Aspects.Keywords do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    words: []
  ]

  def new(data, options \\ []) do

    words = Utils.parse_keywords(data[:text])

    struct(%Keywords{lang: data[:lang], words: words})
  end



end

defimpl String.Chars, for: SmeeView.Aspects.Keywords do
  def to_string(k), do: k.words |> Enum.join(", ")
end
