defmodule SmeeViewAspectsProtocolTest do
  use ExUnit.Case


  alias SmeeView.Aspects.Protocol, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
             role: :idp,
             uri: " urn:oasis:names:tc:SAML:2.0:protocol"
             } = ThisAspect.new(
               %{
                 role: :idp,
                 uri: " urn:oasis:names:tc:SAML:2.0:protocol"
               }
             )

    end

  end


end
