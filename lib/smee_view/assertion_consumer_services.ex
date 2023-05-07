defmodule SmeeView.AssertionConsumerServices do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.AssertionConsumerService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:SPSSODescriptor/AssertionConsumerService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s,
    default: ~x"string(@isDefault)"s,
    index: ~x"string(@index)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
