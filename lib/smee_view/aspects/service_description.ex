defmodule SmeeView.Aspects.ServiceDescription do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%ServiceDescription{}, data)
  end

end
