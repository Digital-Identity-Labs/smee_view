defmodule SmeeView.Aspects.Scope do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils


  @type t :: %__MODULE__{
               regex: boolean(),
               domain: binary()
             }

  @derive Jason.Encoder
  defstruct [
    regex: false,
    domain: nil
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
  @spec scope(aspect :: __MODULE__.t()) :: binary()
  def scope(aspect) do
    aspect.domain
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
    aspect.domain
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
  @spec domain(aspect :: __MODULE__.t()) :: binary()
  def domain(aspect) do
    aspect.domain
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
  @spec regex?(aspect :: __MODULE__.t()) :: boolean()
  def regex?(aspect) do
    aspect.domain
  end


  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Scope do
  def to_string(a), do: a.domain
end
