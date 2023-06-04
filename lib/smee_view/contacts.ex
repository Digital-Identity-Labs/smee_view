defmodule SmeeView.Contacts do

  @moduledoc """
  This module can extracts the `<ContactPerson>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

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
