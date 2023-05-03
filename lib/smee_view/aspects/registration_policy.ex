defmodule SmeeView.Aspects.RegistrationPolicy do

  alias __MODULE__
  alias SmeeView.Utils




  defstruct [
    lang: "en",
    url: nil
  ]

  use SmeeView.Aspects.AspectCommon


  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.RegistrationPolicy do
  def to_string(a), do: a.url
end
