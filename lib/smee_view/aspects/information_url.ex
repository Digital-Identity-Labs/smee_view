defmodule SmeeView.Aspects.InformationURL do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%InformationURL{}, data)
  end

end
