defmodule SmeeView.Aspects.OrganizationURL do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    url: nil
  ]

  def new(data, options \\ []) do
    struct(%OrganizationURL{}, data)
  end

end
