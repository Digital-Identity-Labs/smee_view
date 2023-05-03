defmodule SmeeView.Aspects.Displayname do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon


end
