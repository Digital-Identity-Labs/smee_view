defmodule SmeeView.Aspects.NameidMappingService do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    binding: nil,
    location: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:endpoint]


end

defimpl String.Chars, for: SmeeView.Aspects.NameidMappingService do
  def to_string(a), do: a.location
end
