defmodule SmeeView.Aspects.AssertionConsumerService do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  defstruct [
    binding: nil,
    location: nil,
    index: nil,
    default: false
  ]

  use SmeeView.Aspects.AspectCommon

end
