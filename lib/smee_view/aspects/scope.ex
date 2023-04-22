defmodule SmeeView.Aspects.Scope do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    regex: false,
    domain: nil
  ]

  def new(data, options \\ []) do
    struct(%Scope{}, data)
  end

end
