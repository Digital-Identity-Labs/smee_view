defmodule SmeeView.Aspects.RequestedAttribute do

  @moduledoc """
  Represents and processes <RequestedAttribute> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               friendly_name: binary(),
               name: binary(),
               name_format: binary(),
               required: boolean()
             }

  @derive Jason.Encoder
  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil,
    required: false
  ]

  use SmeeView.Aspects.AspectCommon, features: [:attr]

  @doc """
  Returns true if the attribute is required

  ```
  SmeeView.Aspects.RequestedAttribute.required?(aspect)
  # => false
  ```
  """
  @spec required?(aspect :: __MODULE__.t()) :: binary()
  def required?(aspect) do
    aspect.required
  end

  @doc """
  Returns true if the attribute is optional

  ```
  SmeeView.Aspects.RequestedAttribute.optional?(aspect)
  # => true
  ```
  """
  @spec optional?(aspect :: __MODULE__.t()) :: binary()
  def optional?(aspect) do
    !required?(aspect)
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data, _options \\ []) do
    Map.merge(data, %{required: Utils.parse_boolean(data[:required])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.RequestedAttribute do
  @moduledoc false
  def to_string(a), do: a.friendly_name
end
