defmodule SmeeView.Aspects.Network do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    network: nil
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Network do
  def to_string(a), do: a.network
end
