defmodule SmeeView.Aspects.Registration do

  @moduledoc """
  Represents and processes <mdrpi:RegistrationInfo> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils


  @type t :: %__MODULE__{
               authority: binary(),
               instant: binary(),
               policies: list()
             }

  @derive Jason.Encoder
  defstruct [
    authority: nil,
    instant: nil,
    policies: []
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the ID URI of the registrar/registration authority

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.authority(aspect)
  # => "http://ukfederation.org.uk"
  ```
  """
  @spec authority(aspect :: __MODULE__.t()) :: binary()
  def authority(aspect) do
    aspect.authority
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.instant(aspect)
  # => "2014-11-07T16:35:40Z"
  ```
  """
  @spec instant(aspect :: __MODULE__.t()) :: binary()
  def instant(aspect) do
    aspect.instant
  end

  @doc """
  Returns a list of any registration policies

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.policies(aspect)
  # => [%RegistrationPolicy{lang="en"}, %RegistrationPolicy{lang="sco"}]
  ```
  """
  @spec policies(aspect :: __MODULE__.t()) :: list()
  def policies(aspect) do
    aspect.policies || []
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Registration do
  def to_string(a), do: a.authority
end
