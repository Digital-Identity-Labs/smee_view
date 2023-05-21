defmodule SmeeView.Aspects.Publication do

  @moduledoc """
  Represents and processes <Publication> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               publisher: binary(),
               publication_id: binary()
             }

  @derive Jason.Encoder
  defstruct [
    publisher: nil,
    publication_id: nil
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
  @spec publisher(aspect :: __MODULE__.t()) :: binary()
  def publisher(aspect) do
    aspect.publisher
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
  @spec publication_id(aspect :: __MODULE__.t()) :: binary()
  def publication_id(aspect) do
    aspect.publication_id
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Publication do
  def to_string(a), do: "#{a.publisher} #{a.publication_id}"
end
