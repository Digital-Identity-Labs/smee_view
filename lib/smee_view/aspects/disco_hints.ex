defmodule SmeeView.Aspects.DiscoHints do

  @moduledoc """
  This aspect contains a bundle of related Discovery ("Disco") aspects from entity metadata.

  Since scopes, networks, gelocations, domains, keywords, etc are often used together this Aspect exists to make
  gathering them all a little simpler.

  You can extract and process each of the different types of aspects using their own View modules:

  * `SmeeView.Scopes`
  * `SmeeView.Networks`
  * `SmeeView.Geolocations`
  * `SmeeView.Keywords`
  * `SmeeView.Domains`

  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               scopes: list(),
               networks: list(),
               geolocations: list(),
               keywords: list(),
               domains: list(),
             }

  @derive Jason.Encoder
  defstruct [
    scopes: [],
    networks: [],
    geolocations: [],
    keywords: [],
    domains: [],
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
  @spec scopes(aspect :: __MODULE__.t()) :: list()
  def scopes(aspect) do
    aspect.scopes || []
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
  @spec networks(aspect :: __MODULE__.t()) :: list()
  def networks(aspect) do
    aspect.networks || []
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
  @spec geolocations(aspect :: __MODULE__.t()) :: list()
  def geolocations(aspect) do
    aspect.geolocations || []
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
  @spec keywords(aspect :: __MODULE__.t()) :: list()
  def keywords(aspect) do
    aspect.keywords || []
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
  @spec domains(aspect :: __MODULE__.t()) :: list()
  def domains(aspect) do
    aspect.domains || []
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Organization do
  def to_string(a), do: "Disco Hints"
end
