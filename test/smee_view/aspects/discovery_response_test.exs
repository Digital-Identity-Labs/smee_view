defmodule SmeeViewAspectsDiscoveryResponseTest do
  use ExUnit.Case

  alias SmeeView.Aspects.DiscoveryResponse, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol",
               location: "https://wrgsb01.weill.cornell.edu/Shibboleth.sso/Login",
               index: 6
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol",
                 location: "https://wrgsb01.weill.cornell.edu/Shibboleth.sso/Login",
                 index: "6"
               }
             )

    end

  end

end
