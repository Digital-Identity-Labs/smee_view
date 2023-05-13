defmodule SmeeView.Aspects.EntityAttribute do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               name: binary(),
               values: list()
             }


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
