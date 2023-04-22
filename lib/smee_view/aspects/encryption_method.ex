defmodule SmeeView.Aspects.EncryptionMethod do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    algorithm: nil
  ]

  def new(data, options \\ []) do
    struct(%EncryptionMethod{}, data)
  end

  #######################################################################################


end
