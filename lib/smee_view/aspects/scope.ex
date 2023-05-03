defmodule SmeeView.Aspects.Scope do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    regex: false,
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon

end
