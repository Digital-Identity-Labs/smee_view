defmodule SmeeView.Aspects.SingleLogoutService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%SingleLogoutService{}, data)
  end

end
