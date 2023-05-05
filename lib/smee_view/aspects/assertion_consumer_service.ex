defmodule SmeeView.Aspects.AssertionConsumerService do

  alias __MODULE__
  alias SmeeView.Utils


  defstruct [
    binding: nil,
    location: nil,
    index: nil,
    default: false
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]

end

defimpl String.Chars, for: SmeeView.Aspects.AssertionConsumerService do
  def to_string(a), do: a.location
end
