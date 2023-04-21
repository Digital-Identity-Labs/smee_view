defmodule SmeeView.OrganizationURLs do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.OrganizationURL, roles: false

  @entity_xmap [
    ~x"//md:Organization/md:OrganizationURL"le,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
