defmodule SmeeView.Aspects.Entity do

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
               entity_id: binary(),
               id: binary(),
               valid_until: binary(),
               cache_duration: binary(),
               registration: binary(),
               publications: list(),
               idps: list(),
               sps: list(),
               organizations: list(),
               contacts: list(),
               entity_attributes: list()
             }

  @derive Jason.Encoder
  defstruct [
    entity_id: nil,
    id: nil,
    valid_until: nil,
    cache_duration: nil,
    registration: nil,
    publications: [],
    idps: [],
    sps: [],
    organizations: nil,
    contacts: [],
    entity_attributes: []
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
  @spec entity_id(aspect :: __MODULE__.t()) :: binary()
  def entity_id(aspect) do
    aspect.entity_id
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
  @spec id(aspect :: __MODULE__.t()) :: binary()
  def id(aspect) do
    aspect.id
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
  @spec valid_until(aspect :: __MODULE__.t()) :: binary()
  def valid_until(aspect) do
    aspect.valid_until
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
  @spec cache_duration(aspect :: __MODULE__.t()) :: binary()
  def cache_duration(aspect) do
    aspect.cache_duration
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
  @spec registration(aspect :: __MODULE__.t()) :: struct()
  def registration(aspect) do
    aspect.registration
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
  @spec publications(aspect :: __MODULE__.t()) :: list()
  def publications(aspect) do
    aspect.publications || []
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
  @spec idps(aspect :: __MODULE__.t()) :: list()
  def idps(aspect) do
    aspect.idps || []
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
  @spec sps(aspect :: __MODULE__.t()) :: list()
  def sps(aspect) do
    aspect.sps || []
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
  @spec contacts(aspect :: __MODULE__.t()) :: list()
  def contacts(aspect) do
    aspect.contacts || []
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
  @spec entity_attributes(aspect :: __MODULE__.t()) :: list()
  def entity_attributes(aspect) do
    aspect.entity_attributes || []
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
  @spec idp(aspect :: __MODULE__.t()) :: struct() | nil
  def idp(%{idps: idps}) when is_list(idps) do
    List.first(idps)
  end

  def idp(_) do
    nil
  end

  def idp?(aspect) do
    idp(aspect) != nil
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
  @spec sp(aspect :: __MODULE__.t()) :: struct() | nil
  def sp(%{sps: sps}) when is_list(sps) do
    List.first(sps)
  end

  def sp(_) do
    nil
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
  def sp?(aspect) do
    sp(aspect) != nil
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
  def organization(%{organizations: organizations}) when is_list(organizations) do
    List.first(organizations)
  end

  def organization(_) do
    nil
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
  @spec organization?(aspect :: __MODULE__.t()) :: boolean()
  def organization?(aspect) do
    organization(aspect) != nil
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
  @spec roles(aspect :: __MODULE__.t()) :: list()
  def roles(aspect) do
    [idp(aspect), sp(aspect)] |> Enum.filter(& &1)
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Entity do
  def to_string(a), do: a.entity_id
end
