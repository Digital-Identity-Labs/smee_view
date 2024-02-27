defmodule SmeeView.Aspects.DiscoUI do

  @moduledoc """
  This aspect contains a bundle of related Metadata UI ("mdui:") aspects from entity metadata.

  Since displaynames, descriptions, URLs, etc are often used together this Aspect exists to make
  gathering them all a little simpler.

  You can extract and process each of the different types of aspects using their own View modules:

  * `SmeeView.Displaynames`
  * `SmeeView.Descriptions`
  * `SmeeView.Logos`
  * `SmeeView.PrivacyURLs`
  * `SmeeView.InformationURLs`
  * `SmeeView.Keywords`
  * `SmeeView.Organization`

  """

  @type t :: %__MODULE__{
               displaynames: list(),
               descriptions: list(),
               logos: list(),
               privacy_urls: list(),
               information_urls: list(),
               keywords: list(),
               organizations: list(),
             }

  @derive Jason.Encoder
  defstruct [
    displaynames: [],
    descriptions: [],
    logos: [],
    privacy_urls: [],
    information_urls: [],
    keywords: [],
    organizations: [],
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns list of displaynames aspects (from <mdui:Displayname> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.displaynames(aspect)
  # => [%Displayname{}, %Displayname{}]
  ```
  """
  @spec displaynames(aspect :: __MODULE__.t()) :: list()
  def displaynames(aspect) do
    aspect.displaynames || []
  end

  @doc """
  Returns list of description aspects (from <mdui:Description> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.descriptions(aspect)
  # => [%Description{}, %Description{}]
  ```
  """
  @spec descriptions(aspect :: __MODULE__.t()) :: list()
  def descriptions(aspect) do
    aspect.descriptions || []
  end

  @doc """
  Returns list of logo aspects (from <mdui:Logo> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.logos(aspect)
  # => [%Logo{}, %Logo{}, %Logo{}]
  ```
  """
  @spec logos(aspect :: __MODULE__.t()) :: list()
  def logos(aspect) do
    aspect.logos || []
  end

  @doc """
  Returns a list of Privacy URLs (from <mdui:PrivacyStatementURL> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.privacy_urls(aspect)
  # => [%PrivacyURL{}, %PrivacyURL{}]
  ```
  """
  @spec privacy_urls(aspect :: __MODULE__.t()) :: list()
  def privacy_urls(aspect) do
    aspect.privacy_urls || []
  end

  @doc """
    Returns a list of Information URLs (from <mdui:InformationURL> elements)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.information_urls(aspect)
  # => [%InformationURL{}, %InformationURL{}]
  ```
  """
  @spec information_urls(aspect :: __MODULE__.t()) :: list()
  def information_urls(aspect) do
    aspect.information_urls || []
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
  Returns a list of Organizations (probably just one) for use if MDUI information is missing

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.organizations(aspect)
  # => [%Organization{}]
  ```
  """
  @spec organizations(aspect :: __MODULE__.t()) :: list()
  def organizations(aspect) do
    aspect.organizations || []
  end

  @doc """
  Returns the first Organizations (there is probably just one) for use if MDUI information is missing


  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.organization(aspect)
  # => %Organization{}
  ```
  """
  @spec organization(aspect :: __MODULE__.t()) :: struct() | nil
  def organization(aspect) do
    (aspect.organizations || [])
    |> List.first()
  end

  #######################################################################################

end

