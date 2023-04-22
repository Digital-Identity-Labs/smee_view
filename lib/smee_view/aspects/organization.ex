defmodule SmeeView.Aspects.Organization do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    displaynames: [],
    names: [],
    urls: []
  ]

  def new(data, options \\ []) do
    struct(%Organization{}, data)
  end

  #######################################################################################


end
