defmodule SmeeView.Aspects.DigestMethod do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%DigestMethod{}, data)
  end

  #######################################################################################


end
