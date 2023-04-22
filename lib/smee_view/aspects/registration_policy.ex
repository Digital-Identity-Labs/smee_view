defmodule SmeeView.Aspects.RegistrationPolicy do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    lang: "en",
    url: nil
  ]

  def new(data, options \\ []) do
    struct(%RegistrationPolicy{}, data)
  end

  #######################################################################################

end
