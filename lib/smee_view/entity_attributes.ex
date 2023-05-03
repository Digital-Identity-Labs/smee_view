defmodule SmeeView.EntityAttributes do

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
