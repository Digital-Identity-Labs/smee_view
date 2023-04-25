defmodule SmeeView.Aspects.Description do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools
  use SmeeView.Aspects.AspectCommon

  import SmeeView.Aspects.AspectTools.Text

  defstruct [
    lang: "en",
    text: nil
  ]

  def new(data, options \\ []) do
    struct(%Description{}, data)
  end

  @doc "overloading the docs for lang?"
  defdelegate lang?(aspect), to: AspectTools.Text
  defdelegate lang(aspect), to: AspectTools.Text
  defdelegate text(aspect), to: AspectTools.Text

end
