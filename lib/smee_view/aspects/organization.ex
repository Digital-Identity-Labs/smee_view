defmodule SmeeView.Aspects.Organization do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    displaynames: [],
    names: [],
    urls: []
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Organization do
  def to_string(a), do: "Organization"
end
