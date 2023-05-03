defmodule SmeeView.Aspects.Network do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    network: nil
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Network do
  def to_string(n), do: n.network
end
