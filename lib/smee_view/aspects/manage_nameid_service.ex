defmodule SmeeView.Aspects.ManageNameidService do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    binding: nil,
    location: nil
  ]

  use SmeeView.Aspects.AspectCommon


end

defimpl String.Chars, for: SmeeView.Aspects.ManageNameidService do
  def to_string(a), do: a.location
end
