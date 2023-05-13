defmodule SmeeView.Aspects.ServiceDescription do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               lang: binary(),
               text: binary()
             }

  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :text]

end

defimpl String.Chars, for: SmeeView.Aspects.ServiceDescription do
  def to_string(a), do: a.text
end
