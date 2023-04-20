defmodule SmeeView.Aspects.PrivacyURL do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%PrivacyURL{}, data)
  end

end
