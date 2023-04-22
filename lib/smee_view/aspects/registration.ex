defmodule SmeeView.Aspects.Registration do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

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
