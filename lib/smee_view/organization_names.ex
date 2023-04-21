defmodule SmeeView.OrganizationNames do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.OrganizationName, roles: false

  @entity_xmap [
    ~x"//md:Organization/md:OrganizationName"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end