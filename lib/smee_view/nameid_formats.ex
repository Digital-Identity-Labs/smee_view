defmodule SmeeView.NameIDFormats do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.NameIDFormat, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/NameIDFormat"le,
    uri: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
