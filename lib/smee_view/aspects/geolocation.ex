defmodule SmeeView.Aspects.Geolocation do

  @moduledoc """
  Represents and processes <Geolocation> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               geolocation: binary()
             }

  @derive Jason.Encoder
  defstruct [
    geolocation: nil
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
  @spec geolocation(aspect :: __MODULE__.t()) :: binary()
  def geolocation(aspect) do
    aspect.geolocation
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
    aspect.geolocation
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Geolocation do
  def to_string(a), do: a.geolocation
end
