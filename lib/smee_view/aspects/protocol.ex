defmodule SmeeView.Aspects.Protocol do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    role: nil,
    uri: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:prid], roles: true

end

defimpl String.Chars, for: SmeeView.Aspects.Protocol do
  def to_string(a), do: a.uri
end
