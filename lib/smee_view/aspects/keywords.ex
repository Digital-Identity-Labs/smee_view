defmodule SmeeView.Aspects.Keywords do

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               lang: binary(),
               words: list()
             }

  defstruct [
    lang: "en",
    words: []
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang]

  def text(aspect) do
    aspect.words
    |> Enum.join(" ")
  end

  def words(aspect) do
    aspect.words || []
  end


  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        words: Utils.parse_keywords(data[:text]),
        lang: data[:lang]
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Keywords do
  def to_string(a),
      do: a.words
          |> Enum.join(", ")
end
