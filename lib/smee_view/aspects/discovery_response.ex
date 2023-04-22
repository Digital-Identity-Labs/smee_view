defmodule SmeeView.Aspects.DiscoveryResponse do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%DiscoveryResponse{}, data)
  end

end
