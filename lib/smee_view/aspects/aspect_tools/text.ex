defmodule SmeeView.Aspects.AspectTools.Text do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  def text(aspect) do
    aspect.text || Utils.default_text()
  end


end
