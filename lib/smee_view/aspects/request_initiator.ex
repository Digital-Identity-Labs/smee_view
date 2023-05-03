defmodule SmeeView.Aspects.RequestInitiator do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    binding: nil,
    location: nil
  ]

  use SmeeView.Aspects.AspectCommon

end
