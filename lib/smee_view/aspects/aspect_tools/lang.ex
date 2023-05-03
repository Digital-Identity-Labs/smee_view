defmodule SmeeView.Aspects.AspectTools.Lang do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  @doc "Lang? doc"
  def lang?(aspect, lang \\ Utils.default_lang()) do
    lang(aspect) == lang
  end

  @doc "lang doc"
  def lang(aspect) do
    aspect.lang || Utils.default_lang()
  end

end
