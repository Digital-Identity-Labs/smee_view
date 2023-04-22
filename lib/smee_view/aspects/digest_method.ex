defmodule SmeeView.Aspects.DigestMethod do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%DigestMethod{}, data)
  end

  #######################################################################################


end
