defmodule SmeeView.EntityAttributes do

  @moduledoc """
  This module can extracts the `<mdattr:EntityAttributes>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.EntityAttribute, roles: false

  @entity_xmap [
    ~x"//md:Extensions/mdattr:EntityAttributes/saml:Attribute"le,
    name: ~x"string(@Name)"s,
    values: ~x"string(saml:AttributeValue)"ls
  ]

  def contain?(aspects, name, value) do

  end

  def values_for(aspects, name) do

  end

  def types(aspects) do

  end

  def names(aspects) do

  end

  def categories(aspects) do

  end

  def supports(aspects) do

  end

  def category?(aspect, category) do

  end

  def supports?(aspect, category) do

  end

  def ras?(aspects) do

  end

  def sirtfi?(aspects) do

  end

  def coco?(aspects) do

  end

  #######################################################################################

  defp entity_xmap do
    @entity_xmap
  end


end
