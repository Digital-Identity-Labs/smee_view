defmodule SmeeView.Geolocations do
  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Geolocation, roles: false

  @entity_xmap [
    ~x"//mdui:DiscoHints/mdui:GeolocationHint"le,
    geolocation: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################


end
