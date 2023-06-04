defmodule SmeeView.Aspects.AttributeConsumingService do

  @moduledoc """
  Represents and processes <AttributeConsumingService> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module. Other modules may be needed for aspects of a different type
    contained inside this one.
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

  @doc """
  Returns the index integer for this endpoint/service
  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.index(service)
  # => 1
  ```

  """
  @spec index(aspect :: __MODULE__.t()) :: integer()
  def index(%{index: index}) do
    index
  end

  def index(aspect) do
    1
  end

  @doc """
  Returns a list of requested attributes, if any are present.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.requested_attributes(service)
  # => [%RequestedAttribute{...}, %RequestedAttribute{...}]
  ```
  """
  @spec requested_attributes(aspect :: __MODULE__.t()) :: list()
  def requested_attributes(aspect) do
    aspect.requested_attributes || []
  end

  @doc """
  Returns a list of service descriptions (one per language)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.service_descriptions(service)
  # => [%ServiceDescription{lang: "en", ...}, %ServiceDescription{lang: "cn", ...}]
  ```
  """
  @spec service_descriptions(aspect :: __MODULE__.t()) :: list()
  def service_descriptions(aspect) do
    aspect.service_descriptions || []
  end

  @doc """
  Returns a list of service names (one per language)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.service_names(aspect)
  # => [%ServiceName{lang: "en", ...}, %ServiceName{lang: "cn", ...}]
  ```
  """
  @spec service_names(aspect :: __MODULE__.t()) :: list()
  def service_names(aspect) do
    aspect.service_names || []
  end

  #################################################################################

  #@spec is not needed
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{index: Utils.normalize_index(data[:index]), default: Utils.parse_boolean(data[:default])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.AttributeConsumingService do
@moduledoc false
  def to_string(a), do: "Attribute Consuming Service #{a.index}"
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AttributeConsumingService do
@moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:service_names, :service_descriptions, :requested_attributes, :index, :default])
      |> Map.merge(%{st: "attribute_consuming_service"}),
      opts
    )
  end
end
