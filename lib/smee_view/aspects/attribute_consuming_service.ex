defmodule SmeeView.Aspects.AttributeConsumingService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    default: false,
    index: nil
  ]

  def new(data, options \\ []) do
    struct(%AttributeConsumingService{}, data)
  end

end
