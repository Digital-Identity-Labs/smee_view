defmodule SmeeView.Aspects.Registration do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


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
