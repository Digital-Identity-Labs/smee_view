defmodule SmeeView.Aspects.SP do

  @moduledoc """
  This aspect contains a bundle of related aspects for the SP role of an entity.

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
               authn_requests_signed: boolean(),
               want_assertions_signed: boolean(),
               logos: list(),
               displaynames: list(),
               keywords: list(),
               keys: list(),
               services: list(),
               error_url: nil | binary()
             }

  @derive Jason.Encoder
  defstruct [
    protocols: [],
    authn_requests_signed: false,
    want_assertions_signed: false,
    logos: [],
    displaynames: [],
    keywords: [],
    keys: [],
    services: [],
    error_url: nil
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
  Returns true if the signs authn requests is set

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.authn_requests_signed?(aspect)
  # => false
  ```
  """
  @spec authn_requests_signed?(aspect :: __MODULE__.t()) :: boolean()
  def authn_requests_signed?(aspect) do
    aspect.authn_requests_signed || false
  end

  @doc """
  Returns true if the SP wants assertions to besigned

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.want_assertions_signed?(aspect)
  # => false
  ```
  """
  @spec want_assertions_signed?(aspect :: __MODULE__.t()) :: boolean()
  def want_assertions_signed?(aspect) do
    aspect.want_assertions_signed || false
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

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(
      data,
      %{
        authn_requests_signed: Utils.parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: Utils.parse_boolean(data[:want_assertions_signed])
      }
    )
  end

end


