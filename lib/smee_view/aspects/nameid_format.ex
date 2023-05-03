defmodule SmeeView.Aspects.NameIDFormat do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    uri: nil
  ]

  use SmeeView.Aspects.AspectCommon


end

defimpl String.Chars, for: SmeeView.Aspects.NameIDFormat do
  def to_string(a), do: a.uri
end
