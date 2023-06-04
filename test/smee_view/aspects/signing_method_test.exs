defmodule SmeeViewAspectsSigningMethodTest do
  use ExUnit.Case
  alias SmeeView.Aspects.SigningMethod, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               algorithm: "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1"
             } = ThisAspect.new(
               %{
                 algorithm: "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1"
               }
             )

    end

  end

end
