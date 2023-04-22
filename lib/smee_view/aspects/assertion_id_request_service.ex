defmodule SmeeView.Aspects.AssertionIDRequestService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%AssertionIDRequestService{}, data)
  end

end
