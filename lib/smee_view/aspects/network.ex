defmodule SmeeView.Aspects.Network do

  @moduledoc """
  Represents and processes <mdui:IPHint> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               network: binary()
             }

  @derive Jason.Encoder
  defstruct [
    network: nil
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the value of the network/IPHint as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.network(aspect)
  # => "130.88.0.0/16"
  ```
  """
  @spec network(aspect :: __MODULE__.t()) :: binary()
  def network(aspect) do
    aspect.network
  end

  @doc """
  Returns the value of the network/IPHint as a string

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text(aspect)
  # => "130.88.0.0/16"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.network
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Network do
@moduledoc false
  def to_string(a), do: a.network
end
