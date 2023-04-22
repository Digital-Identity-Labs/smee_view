defmodule SmeeView.Aspects.AssertionConsumerService do

  alias __MODULE__
  alias Smee.Entity

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
