defmodule SmeeView.Aspects.NameIDFormat do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               uri: binary()
             }

  defstruct [
    uri: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:prid]

end

defimpl String.Chars, for: SmeeView.Aspects.NameIDFormat do
  def to_string(a), do: a.uri
end
