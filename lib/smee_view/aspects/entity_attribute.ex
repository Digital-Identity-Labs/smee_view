defmodule SmeeView.Aspects.EntityAttribute do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  use SmeeView.Aspects.AspectCommon

  defstruct [
    name: nil,
    values: []
  ]

  def new(data, options \\ []) do
    struct(%EntityAttribute{}, data)
  end

end
