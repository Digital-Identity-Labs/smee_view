defmodule SmeeView.Networks do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Network, roles: false

  @entity_xmap [
    ~x"//mdui:DiscoHints/mdui:IPHint"le,
    network: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################


end
