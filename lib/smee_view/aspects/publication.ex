defmodule SmeeView.Aspects.Publication do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               publisher: binary(),
               publication_id: binary()
             }

  @derive Jason.Encoder
  defstruct [
    publisher: nil,
    publication_id: nil
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Publication do
  def to_string(a), do: "#{a.publisher} #{a.publication_id}"
end
