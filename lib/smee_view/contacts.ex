defmodule SmeeView.Contacts do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Contact, roles: false

  @entity_xmap [
    ~x"//md:ContactPerson"l,
    type: ~x"string(@contactType)"s,
    givenname: ~x"string(//md:GivenName[1])"s,
    surname: ~x"string(//md:SurName[1])"s,
    email: ~x"string(//md:EmailAddress[1])"s,
    company: ~x"string(//md:Company[1])"s,
    phone: ~x"string(//md:TelephoneNumber[1])"s
  ]

  defp entity_xmap do
    @entity_xmap
  end


  #######################################################################################



end
