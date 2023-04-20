defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Displayname{}, data)
  end

end
