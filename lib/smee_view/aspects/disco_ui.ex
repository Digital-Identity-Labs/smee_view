defmodule SmeeView.Aspects.DiscoUI do

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
               displaynames: list(),
               names: list(),
               logos: list(),
               privacy_urls: list(),
               information_urls: list(),
               keywords: list(),
               organizations: list(),
             }

  @derive Jason.Encoder
  defstruct [
    displaynames: [],
    names: [],
    logos: [],
    privacy_urls: [],
    information_urls: [],
    keywords: [],
    organizations: [],
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
  @spec names(aspect :: __MODULE__.t()) :: list()
  def names(aspect) do
    aspect.names || []
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
  @spec privacy_urls(aspect :: __MODULE__.t()) :: list()
  def privacy_urls(aspect) do
    aspect.privacy_urls || []
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
  @spec information_urls(aspect :: __MODULE__.t()) :: list()
  def information_urls(aspect) do
    aspect.information_urls || []
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
  @spec organizations(aspect :: __MODULE__.t()) :: list()
  def organizations(aspect) do
    aspect.organizations || []
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
  @spec organization(aspect :: __MODULE__.t()) :: struct() | nil
  def organization(aspect) do
    (aspect.organizations || [])
    |> List.first()
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.DiscoUI do
  def to_string(a), do: "Disco UI"
end
