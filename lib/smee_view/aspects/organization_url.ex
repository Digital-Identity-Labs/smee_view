defmodule SmeeView.Aspects.OrganizationURL do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    url: nil
  ]

  def new(data, options \\ []) do
    struct(%OrganizationURL{}, data)
  end

end
