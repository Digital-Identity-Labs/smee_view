defmodule SmeeViewAspectsNameIDMappingServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.NameidMappingService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
               location: "https://id2.rtu.lv:443/openam/NIMSoap/metaAlias/idp",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
                 location: "https://id2.rtu.lv:443/openam/NIMSoap/metaAlias/idp",
               }
             )

    end

  end

end
