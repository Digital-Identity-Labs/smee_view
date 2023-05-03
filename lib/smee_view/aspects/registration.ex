defmodule SmeeView.Aspects.Registration do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    authority: nil,
    instant: nil,
    policies: []
  ]

  use SmeeView.Aspects.AspectCommon



  #######################################################################################


end
