defmodule SmeeView.Aspects.Publication do

  @moduledoc """
  Represents and processes  <mdrpi:Publication> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

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
  Returns the URI ID of the publisher as a binary string.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.publisher(aspect)
  # => "urn:mace:switch.ch:SWITCHaai"
  ```
  """
  @spec publisher(aspect :: __MODULE__.t()) :: binary()
  def publisher(aspect) do
    aspect.publisher
  end

  @doc """
  Returns the publication ID as a binary string.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.publication_id(aspect)
  # => "k3klsoi"
  ```
  """
  @spec publication_id(aspect :: __MODULE__.t()) :: binary()
  def publication_id(aspect) do
    aspect.publication_id
  end

  #######################################################################################

end
