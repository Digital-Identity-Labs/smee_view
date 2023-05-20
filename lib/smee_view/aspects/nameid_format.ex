defmodule SmeeView.Aspects.NameIDFormat do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               uri: binary()
             }

  @derive Jason.Encoder
  defstruct [
    uri: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:prid]

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
  @spec nameid(aspect :: __MODULE__.t()) :: binary()
  def nameid(aspect) do
    aspect.uri
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
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.uri
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.NameIDFormat do
  def to_string(a), do: a.uri
end
