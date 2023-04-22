defmodule SmeeView.Aspects.RequestedAttribute do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    friendly_name: nil,
    name: nil,
    name_format: nil
  ]

  def new(data, options \\ []) do
    struct(%RequestedAttribute{}, data)
  end

end
