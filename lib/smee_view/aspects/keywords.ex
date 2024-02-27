defmodule SmeeView.Aspects.Keywords do

  @moduledoc """
  Represents and processes <mdui:Keywords> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


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
  Lists all keywords in this set as a single binary string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text(aspect)
  # => "GÉANT geant Terena Dante"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.words
    |> Enum.join(" ")
  end

  @doc """
  Returns the keywords in one keyword set as a list of strings

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.words(aspect)
  # => ["GÉANT", "geant", "Terena" "Dante"]
  ```
  """
  @spec words(aspect :: __MODULE__.t()) :: list()
  def words(aspect) do
    aspect.words || []
  end

  ############################################################

  #@spec is not needed
 defp prepare_data(data) do
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
@moduledoc false
  def to_string(a),
      do: a.words
          |> Enum.join(", ")
end
