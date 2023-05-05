defmodule SmeeView.Aspects.EncryptionMethod do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    algorithm: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:algo]


  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.EncryptionMethod do
  def to_string(a), do: a.algorithm
end
