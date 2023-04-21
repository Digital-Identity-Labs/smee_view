defmodule SmeeView.Aspects.Scope do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    regex: false,
    domain: nil
  ]

  def new(data, options \\ []) do
    struct(%Scope{}, data)
  end

end
