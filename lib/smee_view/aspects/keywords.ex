defmodule SmeeView.Aspects.Keywords do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    words: []
  ]

  def new(data, options \\ []) do

    words = parse_keywords(data[:text])

    struct(%Keywords{lang: data[:lang], words: words})
  end

  ## Move to Utils?
  defp parse_keywords(words) when is_nil(words) do
    []
  end

  defp parse_keywords(words) when is_list(words) do
    words
  end

  defp parse_keywords(words) when is_binary(words) do
    words
    |> String.split()
    |> Enum.map(fn s -> String.replace(s, "+", " ") end)
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Keywords do
  def to_string(k), do: k.words |> Enum.join(", ")
end
