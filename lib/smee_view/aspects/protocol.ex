defmodule SmeeView.Aspects.Protocol do

  @moduledoc """
  Represents and processes `protocolSupportEnumeration` XML attributes in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  @type t :: %__MODULE__{
               role: atom(),
               uri: binary()
             }

  @derive Jason.Encoder
  defstruct [
    role: nil,
    uri: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:prid], roles: true

  @doc """
  Returns the protocol URI as a string binary.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.protocol(aspect)
  # => ""urn:oasis:names:tc:SAML:2.0:protocol"
  ```
  """
  @spec protocol(aspect :: __MODULE__.t()) :: binary()
  def protocol(aspect) do
    aspect.uri
  end

  @doc """
  Returns the protocol URI as a string binary.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text(aspect)
  # => ""urn:oasis:names:tc:SAML:2.0:protocol"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.uri
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Protocol do
@moduledoc false
  def to_string(a), do: a.uri
end
