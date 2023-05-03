defmodule SmeeView.Aspects.DigestMethod do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    algorithm: nil
  ]

  use SmeeView.Aspects.AspectCommon



  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.DigestMethod do
  def to_string(a), do: a.algorithm
end
