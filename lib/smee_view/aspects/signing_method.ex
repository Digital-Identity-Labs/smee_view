defmodule SmeeView.Aspects.SigningMethod do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%SigningMethod{}, data)
  end

  #######################################################################################


end
