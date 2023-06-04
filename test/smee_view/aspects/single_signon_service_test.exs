defmodule SmeeViewAspectsSingleSignonServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.SingleSignonService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect",
               location: "https://login.umn.edu/idp/profile/SAML2/Redirect/SSO",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect",
                 location: "https://login.umn.edu/idp/profile/SAML2/Redirect/SSO",
               }
             )

    end

  end

end
