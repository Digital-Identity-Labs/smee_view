defmodule SmeeView.Aspects.SingleSignonService do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    binding: nil,
    location: nil
  ]

  use SmeeView.Aspects.AspectCommon

end

defimpl String.Chars, for: SmeeView.Aspects.SingleSignonService do
  def to_string(a), do: a.location
end
