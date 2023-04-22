defmodule SmeeView.Aspects.RequestedAttribute do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  def new(data, options \\ []) do
    struct(%RequestedAttribute{}, data)
  end

end
