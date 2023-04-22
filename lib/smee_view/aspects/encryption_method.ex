defmodule SmeeView.Aspects.EncryptionMethod do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%EncryptionMethod{}, data)
  end

  #######################################################################################


end
