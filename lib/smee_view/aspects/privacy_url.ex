defmodule SmeeView.Aspects.PrivacyURL do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%PrivacyURL{}, data)
  end

end
