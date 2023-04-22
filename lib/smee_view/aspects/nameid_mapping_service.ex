defmodule SmeeView.Aspects.NameidMappingService do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%NameidMappingService{}, data)
  end

end
