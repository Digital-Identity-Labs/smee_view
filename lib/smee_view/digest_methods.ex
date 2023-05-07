defmodule SmeeView.DigestMethods do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.DigestMethod, roles: false, features: [:algo]

  @entity_xmap [
    ~x"//md:Extensions/alg:DigestMethod"le,
    algorithm: ~x"string(@Algorithm)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
