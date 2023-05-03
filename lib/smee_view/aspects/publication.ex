defmodule SmeeView.Aspects.Publication do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



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
