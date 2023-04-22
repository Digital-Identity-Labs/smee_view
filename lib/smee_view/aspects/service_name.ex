defmodule SmeeView.Aspects.ServiceName do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%ServiceName{}, data)
  end

end
