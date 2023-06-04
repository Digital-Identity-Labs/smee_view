defmodule SmeeViewAspectsDisplaynameTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Displayname, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               text: "Organic Identity Provider",
               role: :idp
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "Organic Identity Provider",
                 role: :idp
               }
             )

    end
  end

end
