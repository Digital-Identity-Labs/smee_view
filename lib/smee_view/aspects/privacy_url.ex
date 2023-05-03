defmodule SmeeView.Aspects.PrivacyURL do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon


end

defimpl String.Chars, for: SmeeView.Aspects.PrivacyURL do
  def to_string(a), do: a.url
end
