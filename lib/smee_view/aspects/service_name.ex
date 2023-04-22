defmodule SmeeView.Aspects.ServiceName do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%ServiceName{}, data)
  end

end
