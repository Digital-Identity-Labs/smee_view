defmodule SmeeView.Aspects.Organization do

  alias __MODULE__
  alias Smee.Entity

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
