defmodule SmeeView.Aspects.EntityAttribute do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    name: nil,
    values: []
  ]

  use SmeeView.Aspects.AspectCommon




end

defimpl String.Chars, for: SmeeView.Aspects.EntityAttribute do
  def to_string(a), do: a.values
                        |> Enum.join("; ")
end
