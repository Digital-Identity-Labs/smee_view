defmodule SmeeView.Contacts do

  use SmeeView.View, aspect: SmeeView.Aspects.Contact, roles: false

  @idp_xmap [~x"//md:ContactPerson"l,
    type: ~x"string(@contactType)"s,
    givenname: ~x"string(//md:GivenName[1])"s,
    surname:    ~x"string(//md:SurName[1])"s,
    email: ~x"string(//md:EmailAddress[1])"s,
    company: ~x"string(//md:Company[1])"s,
    phone: ~x"string(//md:TelephoneNumber[1])"s
  ]

  @sp_xmap [~x"//md:ContactPerson"l,
    type: ~x"string(@contactType)"s,
    givenname: ~x"string(//md:GivenName[1])"s,
    surname:    ~x"string(//md:SurName[1])"s,
    email: ~x"string(//md:EmailAddress[1])"s,
    company: ~x"string(//md:Company[1])"s,
    phone: ~x"string(//md:TelephoneNumber[1])"s
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @idp_xmap
  end

  #######################################################################################



end
