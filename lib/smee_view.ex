defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.
  """

  alias SmeeView.Logos
  alias SmeeView.Keys
  alias SmeeView.Contacts
  alias SmeeView.Descriptions
  alias SmeeView.Domains
  alias SmeeView.Networks
  alias SmeeView.Geolocations
  alias SmeeView.Keywords

  def logos(entity, options \\ []) do
    Logos.view(entity, :all, options)
  end

  def keys(entity, options \\ []) do
    Keys.view(entity, :all,  options)
  end

  def contacts(entity, options \\ []) do
    Contacts.view(entity, :all, options)
  end

  def displaynames(entity, options \\ []) do
    Displaynames.view(entity, :all,  options)
  end

  def descriptions(entity, options \\ []) do
    Descriptions.view(entity, :all,  options)
  end

  def domains(entity, options \\ []) do
    Domains.view(entity, :all,  options)
  end

  def networks(entity, options \\ []) do
    Networks.view(entity, :all,  options)
  end

  def geolocations(entity, options \\ []) do
    Geolocations.view(entity, :all,  options)
  end

  def keywords(entity, options \\ []) do
    Keywords.view(entity, :all,  options)
  end

end
