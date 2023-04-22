defmodule SmeeView.Aspects.AspectTools.Text do

  alias __MODULE__
  alias SmeeView.Utils

  def text(aspect) do
    aspect.text || Utils.default_text()
  end

  @doc "Lang doc"
  def lang?(aspect, lang \\ Utils.default_lang()) do
    lang(aspect) == lang
  end

  def lang(aspect) do
    aspect.lang || Utils.default_lang()
  end

end
