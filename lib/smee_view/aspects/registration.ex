defmodule SmeeView.Aspects.Registration do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    authority: nil,
    instant: nil,
    policies: []
  ]

  use SmeeView.Aspects.AspectCommon



  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Registration do
  def to_string(a), do: a.authority
end
