defmodule SmeeViewAspectsArtifactResolutionServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.ArtifactResolutionService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
               location: "https://shibboleth.sc.edu:8443/idp/profile/SAML2/SOAP/ArtifactResolution",
               index: 2
             } = ThisAspect.new(
               %{
                 binding: "urn:oasis:names:tc:SAML:2.0:bindings:SOAP",
                 location: "https://shibboleth.sc.edu:8443/idp/profile/SAML2/SOAP/ArtifactResolution",
                 index: "2"
               }
             )

    end

  end

end
