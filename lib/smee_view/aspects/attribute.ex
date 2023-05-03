defmodule SmeeView.Aspects.Attribute do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  use SmeeView.Aspects.AspectCommon

end

defimpl String.Chars, for: SmeeView.Aspects.Attribute do
  def to_string(a), do: a.friendly_name
end
