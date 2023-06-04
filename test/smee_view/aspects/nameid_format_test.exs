defmodule SmeeViewAspectsNameIDFormatTest do
  use ExUnit.Case
  alias SmeeView.Aspects.NameIDFormat, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               uri: "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
             } = ThisAspect.new(
               %{
                 uri: "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
               }
             )

    end

  end


end
