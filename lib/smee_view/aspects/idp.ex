defmodule SmeeView.Aspects.IdP do

  @moduledoc """
  This aspect contains a bundle of related Metadata UI ("MDUI") aspects from entity metadata.

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

  alias __MODULE__
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
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec protocols(aspect :: __MODULE__.t()) :: list()
  def protocols(aspect) do
    aspect.protocols || []
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
  @spec want_authn_requests_signed?(aspect :: __MODULE__.t()) :: boolean()
  def want_authn_requests_signed?(aspect) do
    aspect.want_authn_requests_signed || false
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
  @spec logos(aspect :: __MODULE__.t()) :: list()
  def logos(aspect) do
    aspect.logos || []
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
  @spec displaynames(aspect :: __MODULE__.t()) :: list()
  def displaynames(aspect) do
    aspect.displaynames || []
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
  @spec domains(aspect :: __MODULE__.t()) :: list()
  def domains(aspect) do
    aspect.domains || []
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
  @spec keys(aspect :: __MODULE__.t()) :: list()
  def keys(aspect) do
    aspect.keys || []
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
  @spec nameid_formats(aspect :: __MODULE__.t()) :: list()
  def nameid_formats(aspect) do
    aspect.nameid_formats || []
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
  @spec services(aspect :: __MODULE__.t()) :: list()
  def services(aspect) do
    aspect.services || []
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
  @spec attributes(aspect :: __MODULE__.t()) :: list()
  def attributes(aspect) do
    aspect.attributes || []
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        want_authn_requests_signed: Utils.parse_boolean(data[:want_authn_requests_signed])
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.IdP do
  def to_string(a), do: "IdP"
end
