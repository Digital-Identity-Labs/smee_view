defmodule SmeeView.Aspects.ManageNameidService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%ManageNameidService{}, data)
  end

end
