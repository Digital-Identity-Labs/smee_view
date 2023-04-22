defmodule SmeeView.Aspects.SigningMethod do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%SigningMethod{}, data)
  end

  #######################################################################################


end
