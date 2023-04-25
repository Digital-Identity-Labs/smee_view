defmodule SmeeView.Aspects.AssertionConsumerService do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools
  use SmeeView.Aspects.AspectCommon


  defstruct [
    binding: nil,
    location: nil,
    index: nil,
    default: false
  ]

  def new(data, options \\ []) do
    struct(%AssertionConsumerService{}, data)
  end

end
