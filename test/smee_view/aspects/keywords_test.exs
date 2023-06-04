defmodule SmeeViewAspectsKeywordsTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Keywords, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               words: ["XX", "test", "words", "two words"],
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "XX test words, two+words",
               }
             )

    end
  end

end
