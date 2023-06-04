defmodule SmeeViewAspectsManageNameIDServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.ManageNameidService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
               location: "https://ssl.casus.net/Shibboleth.sso/NIM/POST",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
                 location: "https://ssl.casus.net/Shibboleth.sso/NIM/POST",
               }
             )

    end

  end
end
