defmodule SmeeView.Aspects.Geolocation do

  @moduledoc """
  Represents and processes <mdui:GeolocationHint> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  @type t :: %__MODULE__{
               geolocation: binary()
             }

  @derive Jason.Encoder
  defstruct [
    geolocation: nil
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the geolocation as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.geolocation(aspect)
  # => "geo:47.37328,8.531126"
  ```
  """
  @spec geolocation(aspect :: __MODULE__.t()) :: binary()
  def geolocation(aspect) do
    aspect.geolocation
  end

  @doc """
  Returns the geolocation as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text(aspect)
  # => "geo:47.37328,8.531126"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.geolocation
  end

  #######################################################################################

end

