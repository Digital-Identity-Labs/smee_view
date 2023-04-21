defmodule SmeeView.OrganizationDisplaynames do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.OrganizationDisplayname, roles: false

  @entity_xmap [
    ~x"//md:Organization/md:OrganizationDisplayName"le,
    lang: ~x"string(@xml:lang)"s,
    text: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
