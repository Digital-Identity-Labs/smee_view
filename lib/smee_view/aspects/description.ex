defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  #import SmeeView.Aspects.AspectTools.Text

  defstruct [
    lang: "en",
    text: nil
  ]

  use SmeeView.Aspects.AspectCommon



  defdelegate lang?(aspect), to: AspectTools.Text

  defdelegate lang(aspect), to: AspectTools.Text

  defdelegate text(aspect), to: AspectTools.Text

end

defimpl String.Chars, for: SmeeView.Aspects.Description do
  def to_string(a), do: a.text
end
