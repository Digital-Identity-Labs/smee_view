defmodule SmeeView.Aspects.Domain do

  @moduledoc """
  Represents and processes <mdui:DomainHint> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               domain: binary()
             }

  @derive Jason.Encoder
  defstruct [
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the domain as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.domain(aspect)
  # => "unseen.edu"
  ```
  """
  @spec domain(aspect :: __MODULE__.t()) :: binary() | nil
  def domain(aspect) do
    aspect.domain
  end

  @doc """
  Returns the domain as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text8(aspect)
  # => "unseen.edu"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary() | nil
  def text(aspect) do
    domain(aspect)
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Domain do
@moduledoc false
  def to_string(a), do: a.domain
end
