defmodule SmeeView.Aspects.OrganizationName do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  import SmeeView.Aspects.AspectTools.Text

  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon


end
