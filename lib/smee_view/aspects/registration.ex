defmodule SmeeView.Aspects.Registration do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    authority: nil,
    instant: nil,
    policies: []
  ]

  def new(data, options \\ []) do
    struct(%Registration{}, data)
  end

  #######################################################################################


end
