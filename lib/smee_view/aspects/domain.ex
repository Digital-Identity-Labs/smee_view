defmodule SmeeView.Aspects.Domain do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon



  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Domain do
  def to_string(a), do: a.domain
end
