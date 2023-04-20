defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.
  """

  alias SmeeView.Logos
  alias SmeeView.Keys
  alias SmeeView.Contacts

  def logos(entity, options \\ []) do
    Logos.view(entity, options)
  end

  def keys(entity, options \\ []) do
    Keys.view(entity, options)
  end

  def contacts(entity, options \\ []) do
    Contacts.view(entity, options)
  end

end
