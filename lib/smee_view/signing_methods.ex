defmodule SmeeView.SigningMethods do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.SigningMethod, roles: false, features: [:algo]

  @entity_xmap [
    ~x"//md:Extensions/alg:SigningMethod"le,
    algorithm: ~x"string(@Algorithm)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
