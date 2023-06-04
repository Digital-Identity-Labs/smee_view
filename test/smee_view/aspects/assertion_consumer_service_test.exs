defmodule SmeeViewAspectsAssertionConsumerServiceTest do
  use ExUnit.Case
  alias SmeeView.Aspects.AssertionConsumerService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
               location: "https://yaletest.assetworks.cloud/Shibboleth.sso/SAML2/POST",
               index: 13
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
                 location: "https://yaletest.assetworks.cloud/Shibboleth.sso/SAML2/POST",
                 index: "13"
               }
             )

    end

  end
end
