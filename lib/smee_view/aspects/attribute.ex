defmodule SmeeView.Aspects.Attribute do

  alias __MODULE__
  alias SmeeView.Utils


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
