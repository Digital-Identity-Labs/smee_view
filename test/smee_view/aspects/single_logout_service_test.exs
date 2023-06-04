defmodule SmeeViewAspectsSingleLogoutServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.SingleLogoutService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
               location: "https://dp.ucsf.edu/idp/profile/SAML2/POST/SLO",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST",
                 location: "https://dp.ucsf.edu/idp/profile/SAML2/POST/SLO",
               }
             )

    end

  end

end
