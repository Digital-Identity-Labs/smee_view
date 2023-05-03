defmodule SmeeView.Aspects.Domain do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon



  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Domain do
  def to_string(d), do: d.domain
end
