defmodule SmeeView.RegistrationPolicies do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.RegistrationPolicy, roles: false

  @entity_xmap [
    ~x"//md:Extensions/mdrpi:RegistrationInfo/mdrpi:RegistrationPolicy"le,
    lang: ~x"string(@xml:lang)"s,
    url: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
