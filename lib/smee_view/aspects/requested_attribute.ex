defmodule SmeeView.Aspects.RequestedAttribute do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  use SmeeView.Aspects.AspectCommon

end
