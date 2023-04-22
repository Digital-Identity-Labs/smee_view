defmodule SmeeView.Aspects.NameIDFormat do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    uri: nil
  ]

  def new(data, options \\ []) do
    struct(%NameIDFormat{}, data)
  end

end
