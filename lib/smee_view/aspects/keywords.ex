defmodule SmeeView.Aspects.Keywords do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               lang: binary(),
               words: list()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    words: []
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang]

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.words
    |> Enum.join(" ")
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec words(aspect :: __MODULE__.t()) :: list()
  def words(aspect) do
    aspect.words || []
  end

  ############################################################

  #@spec is not needed
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
