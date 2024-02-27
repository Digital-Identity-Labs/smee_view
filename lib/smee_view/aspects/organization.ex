defmodule SmeeView.Aspects.Organization do

  @moduledoc """
  Represents and processes <Organization> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  @type t :: %__MODULE__{
               displaynames: list(),
               names: list(),
               urls: list(),
             }

  @derive Jason.Encoder
  defstruct [
    displaynames: [],
    names: [],
    urls: []
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Lists all displaynames for this organization (one for each language)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.displaynames(aspect)
  # => [OrganizationDisplayname{}, OrganizationDisplayname{}, OrganizationDisplayname{}]
  ```
  """
  @spec displaynames(aspect :: __MODULE__.t()) :: list()
  def displaynames(aspect) do
    aspect.displaynames
  end

  @doc """
  Lists all names for this organization (one for each language)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.names(aspect)
  # => [OrganizationName{}, OrganizationName{}, OrganizationName{}]
  ```
  """
  @spec names(aspect :: __MODULE__.t()) :: list()
  def names(aspect) do
    aspect.names
  end

  @doc """
  Lists all URLs for this organization (one for each language)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.urls(aspect)
  # => [OrganizationURL{}, OrganizationURL{}, OrganizationURL{}]
  ```
  """
  @spec urls(aspect :: __MODULE__.t()) :: list()
  def urls(aspect) do
    aspect.urls
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.DiscoHints do
@moduledoc false
  def to_string(_a), do: "Organization"
end
