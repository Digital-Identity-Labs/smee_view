defmodule SmeeView.Aspects.Scope do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  use SmeeView.Aspects.AspectCommon

  defstruct [
    regex: false,
    domain: nil
  ]

  def new(data, options \\ []) do
    struct(%Scope{}, data)
  end

end
