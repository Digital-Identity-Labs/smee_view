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
  Returns a list of scope aspects used by the entity

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.scopes(aspect)
  # => [%Scope{regex: false, domain: "unseen.edu"}]
  ```
  """
  @spec scopes(aspect :: __MODULE__.t()) :: list()
  def scopes(aspect) do
    aspect.scopes || []
  end

  @doc """
  Returns a list of network aspects (from <mdui:IPHint> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.networks(aspect)
  # => [%Network{}. %Network{}]
  ```
  """
  @spec networks(aspect :: __MODULE__.t()) :: list()
  def networks(aspect) do
    aspect.networks || []
  end

  @doc """
  Returns a list of geolocation aspects (from <mdui:GeolocationHint> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.geolocations(aspect)
  # => [%Network{}. %Network{}]
  ```
  """
  @spec geolocations(aspect :: __MODULE__.t()) :: list()
  def geolocations(aspect) do
    aspect.geolocations || []
  end

  @doc """
  Returns list of keyword aspects (from <mdui:Keywords> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.keywords(aspect)
  # => [%Keywords{}]
  ```
  """
  @spec keywords(aspect :: __MODULE__.t()) :: list()
  def keywords(aspect) do
    aspect.keywords || []
  end

  @doc """
  Return list of domain asspects (from <mdui:DomainHints> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.domains(aspect)
  # => [%Domain{}, %Domain{}]
  ```
  """
  @spec domains(aspect :: __MODULE__.t()) :: list()
  def domains(aspect) do
    aspect.domains || []
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Organization do
@moduledoc false
  def to_string(a), do: "Disco Hints"
end
