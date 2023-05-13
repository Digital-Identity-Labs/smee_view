defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               lang: binary(),
               text: binary(),
               role: atom()
             }

  defstruct [
    lang: "en",
    text: nil,
    role: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text], roles: true

end

defimpl String.Chars, for: SmeeView.Aspects.Description do
  def to_string(a), do: a.text
end
