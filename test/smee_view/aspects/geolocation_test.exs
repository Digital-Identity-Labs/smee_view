defmodule SmeeViewAspectsGeolocationTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Geolocation, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               geolocation: "geo:53.465624,-2.233193"
             } = ThisAspect.new(
               %{
                 geolocation: "geo:53.465624,-2.233193"
               }
             )

    end
  end
end
