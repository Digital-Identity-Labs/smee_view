defmodule SmeeView.Aspects.Geolocation do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    geolocation: nil
  ]

  def new(data, options \\ []) do
    struct(%Geolocation{}, data)
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Geolocation do
  def to_string(gl), do: gl.geolocation
end
