defmodule SmeeView.Aspects.Network do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    network: nil
  ]

  def new(data, options \\ []) do
    struct(%Network{}, data)
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Network do
  def to_string(n), do: n.network
end
