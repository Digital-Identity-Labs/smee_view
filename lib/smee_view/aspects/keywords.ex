defmodule SmeeView.Aspects.Keywords do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  import SmeeView.Aspects.AspectTools.Text, except: [text: 1]

  defstruct [
    lang: "en",
    words: []
  ]

  use SmeeView.Aspects.AspectCommon


  def new(data, options \\ []) do

    words = Utils.parse_keywords(data[:text])

    struct(%Keywords{lang: data[:lang], words: words})
  end

  def text(aspect) do
    aspect.words
    |> Enum.join(" ")
  end

  def words(aspect) do
    aspect.words || []
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Keywords do
  def to_string(k), do: k.words |> Enum.join(", ")
end
