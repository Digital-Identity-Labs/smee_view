defmodule SmeeView.Aspects.IdP do

  @moduledoc """
  This aspect contains a bundle of related aspects for the IdP role of an entity.

  Since displaynames, descriptions, URLs, etc are often used together this Aspect exists to make
  gathering them all a little simpler.

  You can extract and process each of the different types of aspects using their own View modules:

  * `SmeeView.Displaynames`
  * `SmeeView.Names`
  * `SmeeView.Logos`
  * `SmeeView.PrivacyURLs`
  * `SmeeView.InformationURLs`
  * `SmeeView.Keywords`
  * `SmeeView.Organization`

  """


  alias SmeeView.Utils
  @type t :: %__MODULE__{
               protocols: list(),
               want_authn_requests_signed: boolean(),
               scopes: list(),
               logos: list(),
               displaynames: list(),
               networks: list(),
               geolocations: list(),
               domains: list(),
               keywords: list(),
               keys: list(),
               nameid_formats: list(),
               services: list(),
               attributes: list(),
             }

  @derive Jason.Encoder
  defstruct [
    protocols: [],
    want_authn_requests_signed: false,
    scopes: [],
    logos: [],
    displaynames: [],
    networks: [],
    geolocations: [],
    domains: [],
    keywords: [],
    keys: [],
    nameid_formats: [],
    services: [],
    attributes: []
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns a list of protocol aspects for this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.protocols(aspect)
  # => [%Protocol{}, %Protocol{}]
  ```
  """
  @spec protocols(aspect :: __MODULE__.t()) :: list()
  def protocols(aspect) do
    aspect.protocols || []
  end

  @doc """
  Returns true if the IdP demands Authn requests to be signed

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.want_authn_requests_signed?(aspect)
  # => false
  ```
  """
  @spec want_authn_requests_signed?(aspect :: __MODULE__.t()) :: boolean()
  def want_authn_requests_signed?(aspect) do
    aspect.want_authn_requests_signed || false
  end

  @doc """
  Lists Shibboleth domain scopes used by the IdP (*not* oauth/OIDC scopes)

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
  Lists MDUI logos used by this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.logos(aspect)
  # => [Logo{}, Logo{}, Logo{}]
  ```
  """
  @spec logos(aspect :: __MODULE__.t()) :: list()
  def logos(aspect) do
    aspect.logos || []
  end

  @doc """
  Lists MDUI displaynames used by this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.displaynames(aspect)
  # => [%Displayname{}, %Displayname{}, %Displayname{}]
  ```
  """
  @spec displaynames(aspect :: __MODULE__.t()) :: list()
  def displaynames(aspect) do
    aspect.displaynames || []
  end

  @doc """
  Lists MDDisco IPHints as Network aspects

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.networks(aspect)
  # => [%Network{}, %Network{}]
  ```
  """
  @spec networks(aspect :: __MODULE__.t()) :: list()
  def networks(aspect) do
    aspect.networks || []
  end

  @doc """
  List MD Disco geolocation hints as geolocation aspects

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.geolocations(aspect)
  # => [Geolocation{},Geolocation{}]
  ```
  """
  @spec geolocations(aspect :: __MODULE__.t()) :: list()
  def geolocations(aspect) do
    aspect.geolocations || []
  end

  @doc """
  Lists MD Disco domain hints as domain aspects

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.domains(aspect)
  # => [%Domain{}]
  ```
  """
  @spec domains(aspect :: __MODULE__.t()) :: list()
  def domains(aspect) do
    aspect.domains || []
  end

  @doc """
  Lists MD Disco keyword sets as Keywords aspects

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.keywords(aspect)
  # => [Keywords{}]
  ```
  """
  @spec keywords(aspect :: __MODULE__.t()) :: list()
  def keywords(aspect) do
    aspect.keywords || []
  end

  @doc """
  Lists public keys for this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.keys(aspect)
  # => [%Key{}, %Key{}]
  ```
  """
  @spec keys(aspect :: __MODULE__.t()) :: list()
  def keys(aspect) do
    aspect.keys || []
  end

  @doc """
  List NameID format URIs as aspects

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.nameid_formats(aspect)
  # => [%NameID{}]
  ```
  """
  @spec nameid_formats(aspect :: __MODULE__.t()) :: list()
  def nameid_formats(aspect) do
    aspect.nameid_formats || []
  end

  @doc """
  Lists all types of services for this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.services(aspect)
  # => [%SingleSignOnService{}, %SingleLogoutService{}]
  ```
  """
  @spec services(aspect :: __MODULE__.t()) :: list()
  def services(aspect) do
    aspect.services || []
  end

  @doc """
  Lists of attributes associated with this role

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.attributes(aspect)
  # => [%Attribute{}, %Attribute{}]
  ```
  """
  @spec attributes(aspect :: __MODULE__.t()) :: list()
  def attributes(aspect) do
    aspect.attributes || []
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(data) do
    Map.merge(
      data,
      %{
        want_authn_requests_signed: Utils.parse_boolean(data[:want_authn_requests_signed])
      }
    )
  end

end
