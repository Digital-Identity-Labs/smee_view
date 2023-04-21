defmodule SmeeView.Aspects.OrganizationDisplayname do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%OrganizationDisplayname{}, data)
  end

end
