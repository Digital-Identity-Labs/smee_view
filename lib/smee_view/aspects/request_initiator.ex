defmodule SmeeView.Aspects.RequestInitiator do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%RequestInitiator{}, data)
  end

end