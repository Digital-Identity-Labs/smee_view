defmodule SmeeView.Aspects.PrivacyURL do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               lang: binary(),
               url: binary()
             }

  @derive Jason.Encoder
  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :url]


end

defimpl String.Chars, for: SmeeView.Aspects.PrivacyURL do
  def to_string(a), do: a.url
end
