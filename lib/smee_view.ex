defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.
  """

  alias SmeeView.Logos
  alias SmeeView.Keys

  def logos(entity, options \\ []) do
    Logos.view(entity, options)
  end

  def keys(entity, options \\ []) do
    Keys.view(entity, options)
  end

end
