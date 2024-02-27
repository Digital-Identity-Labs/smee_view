defmodule SmeeView.Aspects.Entity do

  @moduledoc """
  This aspect contains a bundle of related aspects from entity metadata. It is the top-level structure for SmeeView.

  This is the most complicated *and slowest* Aspect structure in SmeeView, so unless you need everything within this
    structure, you will probably be better off using other Views to extract only what you need directly.

  You can extract and process each of the different types of aspects using their own View modules:

  """

  @type t :: %__MODULE__{
               entity_id: binary(),
               id: binary(),
               valid_until: binary(),
               cache_duration: binary(),
               registration: struct(),
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
  Returns the entity ID (URI) of the entity.

  This is already available in the `Smee.Entity` record and the keys of prism data

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.entity_id(aspect)
  # => "https://idp.example.com/shibboleth"
  ```
  """
  @spec entity_id(aspect :: __MODULE__.t()) :: binary()
  def entity_id(aspect) do
    aspect.entity_id
  end

  @doc """
  Returns the "ID" of the entity's metadata record *not the entity ID*.

  This field will often be blank, and will differ for the same entity in different federations

  It will often be "_" or nil
  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.id(aspect)
  # => "ex378486"
  ```
  """
  @spec id(aspect :: __MODULE__.t()) :: binary()
  def id(aspect) do
    aspect.id
  end

  @doc """
  Returns the valid until expiry date from the Entity.

  This should already be available in the `Smee.Entity` record, but that may be derived from the default in the parent
  metadata.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.valid_until(aspect)
  # => "2021-12-25T17:33:22.438Z"
  ```
  """
  @spec valid_until(aspect :: __MODULE__.t()) :: binary()
  def valid_until(aspect) do
    aspect.valid_until
  end

  @doc """
  Returns the cache duration value for the metadata, as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.cache_duration(aspect)
  # => "PT6H0M0.000S"
  ```
  """
  @spec cache_duration(aspect :: __MODULE__.t()) :: binary()
  def cache_duration(aspect) do
    aspect.cache_duration
  end

  @doc """
  Registration aspect for the entity

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.registration(aspect)
  # => %Registration{}
  ```
  """
  @spec registration(aspect :: __MODULE__.t()) :: struct()
  def registration(aspect) do
    aspect.registration
  end

  @doc """
  PublicationPath - list of Publications for the entity

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.publications(aspect)
  # => [%Publication{}]
  ```
  """
  @spec publications(aspect :: __MODULE__.t()) :: list()
  def publications(aspect) do
    aspect.publications || []
  end

  @doc """
  Returns a list of all IdP role aspects (there will be zero or one IdPs in the list)

  See `idp/1` too, which returns one or nil
  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.idps(aspect)
  # => [%IdP{}]
  ```
  """
  @spec idps(aspect :: __MODULE__.t()) :: list()
  def idps(aspect) do
    aspect.idps || []
  end

  @doc """
  Returns a list of all SP role aspects (there will be zero or one SPs in the list)

  See `sp/1` too, which returns one or nil
  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.sps(aspect)
  # => [%SP{}]
  ```
  """
  @spec sps(aspect :: __MODULE__.t()) :: list()
  def sps(aspect) do
    aspect.sps || []
  end

  @doc """
  Returns a list of Organization aspects in the entity

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
  Returns a list of all contact aspects in the entity

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.contacts(aspect)
  # => [%Contact{}, %Contact{}, %Contact{}]
  ```
  """
  @spec contacts(aspect :: __MODULE__.t()) :: list()
  def contacts(aspect) do
    aspect.contacts || []
  end

  @doc """
  Returns a list of all Entity Attribute aspects for the entity

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.entity_attributes(aspect)
  # => [%EntityAttribute{}, %EntityAttribute{}, %EntityAttribute{}]
  ```
  """
  @spec entity_attributes(aspect :: __MODULE__.t()) :: list()
  def entity_attributes(aspect) do
    aspect.entity_attributes || []
  end

  @doc """
  Returns the IdP role attribute for the entity, or nil

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.idp(aspect)
  # => %IdP{}
  ```
  """
  @spec idp(aspect :: __MODULE__.t()) :: struct() | nil
  def idp(%{idps: idps}) when is_list(idps) do
    List.first(idps)
  end

  def idp(_) do
    nil
  end

  @doc """
  Returns true if an IdP role is present

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.idp?(aspect)
  # => true
  ```
  """
  def idp?(aspect) do
    idp(aspect) != nil
  end

  @doc """
  Returns the SP role attribute for the entity, or nil

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.sp(aspect)
  # => %SP{}
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
  Returns true if an SP role is present

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.sp?(aspect)
  # => true
  ```
  """
  def sp?(aspect) do
    sp(aspect) != nil
  end

  @doc """
  Returns the top-level organization aspect for the entity, or nil

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.organization(aspect)
  # => %Organization{}
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
  Returns true if an Organization aspect is present

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.organization?(aspect)
  # => true
  ```
  """
  @spec organization?(aspect :: __MODULE__.t()) :: boolean()
  def organization?(aspect) do
    organization(aspect) != nil
  end

  @doc """
  Lists all roles for the Entity (IdPs, SPs, others)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.roles(aspect)
  # => [%SP{}]
  ```
  """
  @spec roles(aspect :: __MODULE__.t()) :: list()
  def roles(aspect) do
    [idp(aspect), sp(aspect)] |> Enum.filter(& &1)
  end

  #######################################################################################

end
