defmodule SmeeView.Aspects.OrganizationURL do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon


end
