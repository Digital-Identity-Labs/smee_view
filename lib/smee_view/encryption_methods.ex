defmodule SmeeView.EncryptionMethods do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.EncryptionMethod, roles: false, features: [:algo]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/md:KeyDescriptor/EncryptiontMethod"le,
    algorithm: ~x"string(@Algorithm)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
