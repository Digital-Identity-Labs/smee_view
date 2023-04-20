defmodule SmeeView.Aspects.Keywords do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Keywords{}, data)
  end

end
