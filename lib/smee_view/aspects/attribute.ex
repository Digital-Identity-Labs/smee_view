defmodule SmeeView.Aspects.Attribute do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               friendly_name: binary(),
               name: binary(),
               name_format: binary()
             }

  @derive Jason.Encoder
  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:attr]

end

defimpl String.Chars, for: SmeeView.Aspects.Attribute do
  def to_string(a), do: a.friendly_name
end
