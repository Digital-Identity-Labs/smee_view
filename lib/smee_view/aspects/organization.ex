defmodule SmeeView.Aspects.Organization do

  @moduledoc """
  Represents and processes <Organization> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               displaynames: list(),
               names: list(),
               urls: list(),
             }

  @derive Jason.Encoder
  defstruct [
    displaynames: [],
    names: [],
    urls: []
  ]

  use SmeeView.Aspects.AspectCommon

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
  @spec displaynames(aspect :: __MODULE__.t()) :: list()
  def displaynames(aspect) do
    aspect.displaynames
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
  @spec names(aspect :: __MODULE__.t()) :: list()
  def names(aspect) do
    aspect.names
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
  @spec urls(aspect :: __MODULE__.t()) :: list()
  def urls(aspect) do
    aspect.urls
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.DiscoHints do
  def to_string(a), do: "Organization"
end
