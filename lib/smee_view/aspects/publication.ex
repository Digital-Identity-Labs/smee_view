defmodule SmeeView.Aspects.Publication do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    publisher: nil,
    publication_id: nil
  ]

  def new(data, options \\ []) do
    struct(%Publication{}, data)
  end



  #######################################################################################


end