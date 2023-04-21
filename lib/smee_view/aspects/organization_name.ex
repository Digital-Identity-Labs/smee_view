defmodule SmeeView.Aspects.OrganizationName do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%OrganizationName{}, data)
  end

end
