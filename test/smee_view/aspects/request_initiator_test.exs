defmodule SmeeViewAspectsRequestInitiatorTest do
  use ExUnit.Case

  alias SmeeView.Aspects.RequestInitiator, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:profiles:SSO:request-init",
               location: "https://www.conferences.uni-hamburg.de/Shibboleth.sso/Login",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:profiles:SSO:request-init",
                 location: "https://www.conferences.uni-hamburg.de/Shibboleth.sso/Login",
               }
             )

    end

  end

end
