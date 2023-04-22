defmodule SmeeView.Aspects.SingleSignonService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%SingleSignonService{}, data)
  end

end
