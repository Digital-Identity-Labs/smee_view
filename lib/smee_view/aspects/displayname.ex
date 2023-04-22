defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon
  import SmeeView.Aspects.AspectTools.Text

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Displayname{}, data)
  end

end
