defmodule SmeeView.Aspects.Geolocation do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    geolocation: nil
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Geolocation do
  def to_string(a), do: a.geolocation
end
