defmodule SmeeView.Aspects.Scope do

  alias __MODULE__
  alias SmeeView.Utils


  @type t :: %__MODULE__{
               regex: boolean(),
               domain: binary()
             }

  defstruct [
    regex: false,
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon

end

defimpl String.Chars, for: SmeeView.Aspects.Scope do
  def to_string(a), do: a.domain
end
