defmodule SmeeView.Aspects.SP do

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
               authn_requests_signed: boolean(),
               want_assertions_signed: boolean(),
               logos: list(),
               displaynames: list(),
               keywords: list(),
               keys: list(),
               services: list(),
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
    services: []
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
  @spec authn_requests_signed?(aspect :: __MODULE__.t()) :: boolean()
  def authn_requests_signed?(aspect) do
    aspect.authn_requests_signed || false
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
  @spec want_assertions_signed?(aspect :: __MODULE__.t()) :: boolean()
  def want_assertions_signed?(aspect) do
    aspect.want_assertions_signed || false
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
  @spec services(aspect :: __MODULE__.t()) :: list()
  def services(aspect) do
    aspect.services || []
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        authn_requests_signed: Utils.parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: Utils.parse_boolean(data[:want_assertions_signed])
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.SP do
  def to_string(a), do: "SP"
end
