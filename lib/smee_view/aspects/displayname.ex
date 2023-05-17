defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               lang: binary(),
               text: binary(),
               role: atom()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    text: nil,
    role: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]

end

defimpl String.Chars, for: SmeeView.Aspects.Displayname do
  def to_string(a), do: a.text
end
