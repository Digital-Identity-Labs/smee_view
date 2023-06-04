defmodule SmeeViewAspectsAssertionIDRequestServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.AssertionIDRequestService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
               location: "https://secure-acc.etnic.be/nidp/saml2/soap",
               index: 0
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
                 location: "https://secure-acc.etnic.be/nidp/saml2/soap",
               }
             )

    end

  end

end
