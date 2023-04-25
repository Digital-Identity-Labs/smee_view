defmodule SmeeView.Aspects.Organization do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


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
