defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Description{}, data)
  end

end
