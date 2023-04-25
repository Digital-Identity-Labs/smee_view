defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  use SmeeView.Aspects.AspectCommon

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Displayname{}, data)
  end

end
