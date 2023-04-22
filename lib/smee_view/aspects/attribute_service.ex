defmodule SmeeView.Aspects.AttributeService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%AttributeService{}, data)
  end

end
