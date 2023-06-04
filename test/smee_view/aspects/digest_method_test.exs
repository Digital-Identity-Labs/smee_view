defmodule SmeeViewAspectsDigestMethodTest do
  use ExUnit.Case
  alias SmeeView.Aspects.DigestMethod, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               algorithm: "http://www.w3.org/2001/04/xmlenc#sha256"
             } = ThisAspect.new(
               %{
                 algorithm: "http://www.w3.org/2001/04/xmlenc#sha256"
               }
             )

    end

  end

end
