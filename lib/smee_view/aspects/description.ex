defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Description{}, data)
  end

end
