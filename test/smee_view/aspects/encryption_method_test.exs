defmodule SmeeViewAspectsEncryptionMethodTest do
  use ExUnit.Case

  alias SmeeView.Aspects.EncryptionMethod, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               algorithm: "http://www.w3.org/2009/xmlenc11#aes256-gcm"
             } = ThisAspect.new(
               %{
                 algorithm: "http://www.w3.org/2009/xmlenc11#aes256-gcm"
               }
             )

    end

  end


end
