defmodule SmeeViewAspectsLogoTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Logo, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               url: "https://indiid.net/assets/images/logo-compact-medium.png",
               height: 60,
               width: 80,
               role: :idp
             } = ThisAspect.new(
               %{
                 lang: "en",
                 url: "https://indiid.net/assets/images/logo-compact-medium.png",
                 height: "60",
                 width: "80",
                 role: :idp
               }
             )

    end
  end
end
