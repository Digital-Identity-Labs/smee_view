defmodule SmeeViewAspectsInformationURLTest do
  use ExUnit.Case

  alias SmeeView.Aspects.InformationURL, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               url: "https://example.com/path",
             } = ThisAspect.new(
               %{
                 lang: "en",
                 url: "https://example.com/path",
               }
             )

    end
  end
end
