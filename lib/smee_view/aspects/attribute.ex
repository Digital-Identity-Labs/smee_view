defmodule SmeeView.Aspects.Attribute do

  @moduledoc """
  Represents and processes <saml:Attribute> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


  alias SmeeView.Utils

  @type t :: %__MODULE__{
               friendly_name: binary(),
               name: binary(),
               name_format: binary(),
               values: list()
             }

  @derive Jason.Encoder
  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil,
    values: []
  ]

  use SmeeView.Aspects.AspectCommon, features: [:attr]

  @doc """
  Returns true if the attribute has predefined values

  ```
  SmeeView.Aspects.Attribute.defined_values?(aspect)
  # => false
  ```
  """
  @spec defined_values?(aspect :: __MODULE__.t()) :: boolean()
  def defined_values?(aspect) do
    Enum.empty?(aspect.values)
  end

  @doc """
  Returns any predefined values for this attribute, or an empty list

  ```
  SmeeView.Aspects.Attribute.defined_values(aspect)
  # => ["member", "affiliate", "staff", "student"]
  ```
  """
  @spec defined_values(aspect :: __MODULE__.t()) :: boolean()
  def defined_values(aspect) do
    aspect.values || []
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(data, %{values: Utils.parse_attr_values(data[:values])})
  end

end


