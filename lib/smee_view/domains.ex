defmodule SmeeView.Domains do


  use SmeeView.View, aspect: SmeeView.Aspects.Domain, roles: false

  @entity_xmap [
    ~x"//mdui:DiscoHints/mdui:DomainHint"le,
    domain: ~x"./text()"s
  ]


  defp entity_xmap do
    @entity_xmap
  end


  #######################################################################################



end
