defmodule SmeeView.Aspects.ServiceDescription do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%ServiceDescription{}, data)
  end

end
