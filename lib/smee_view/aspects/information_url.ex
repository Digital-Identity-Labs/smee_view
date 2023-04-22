defmodule SmeeView.Aspects.InformationURL do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%InformationURL{}, data)
  end

end
