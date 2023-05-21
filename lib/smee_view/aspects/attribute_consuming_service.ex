defmodule SmeeView.Aspects.AttributeConsumingService do

  @moduledoc """
  Represents and processes <AttributeConsumingService> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               default: boolean(),
               index: integer(),
               requested_attributes: list(),
               service_descriptions: list(),
               service_names: list()
             }

  defstruct [
    default: false,
    index: 1,
    requested_attributes: [],
    service_descriptions: [],
    service_names: []
  ]

  use SmeeView.Aspects.AspectCommon, features: []

  @doc "Returns the index type for this endpoint/service"
  @spec index(aspect ::  __MODULE__.t()) :: integer()
  def index(%{index: index}) do
    index
  end

  def index(aspect) do
    0
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
  @spec requested_attributes(aspect :: __MODULE__.t()) :: list()
  def requested_attributes(aspect) do
    aspect.requested_attributes || []
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
  @spec service_descriptions(aspect :: __MODULE__.t()) :: list()
  def service_descriptions(aspect) do
    aspect.service_descriptions || []
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
  @spec service_names(aspect :: __MODULE__.t()) :: list()
  def service_names(aspect) do
    aspect.service_names || []
  end

  #################################################################################

  #@spec is not needed
 defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AttributeConsumingService do
  def to_string(a), do: "Attribute Consuming Service #{a.index}"
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AttributeConsumingService do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:service_names ,:service_descriptions, :requested_attributes, :index, :default])
      |> Map.merge(%{st: "attribute_consuming_service"}),
      opts
    )
  end
end
