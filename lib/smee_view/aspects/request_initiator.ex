defmodule SmeeView.Aspects.RequestInitiator do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%RequestInitiator{}, data)
  end

end
