defmodule SmeeView.Registration do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Registration, roles: false, one: true

  @entity_xmap [
    ~x"//md:Extensions/mdrpi:RegistrationInfo"le,
    authority: ~x"string(@registrationAuthority)"s,
    instant: ~x"string(@registrationInstant)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end


end
