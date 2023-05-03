defmodule SmeeView.Attributes do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Attribute, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/saml:Attribute"el,
    friendly_name: ~x"string(@FriendlyName)"s,
    name: ~x"string(@Name)"s,
    name_format: ~x"string(@NameFormat)"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

end
