defmodule SmeeViewAspectsPublicationTest do
  use ExUnit.Case


  alias SmeeView.Aspects.Publication, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               publisher: "urn:mace:incommon",
               publication_id: "i2lkd9c"
             } = ThisAspect.new(
               %{
                 publisher: "urn:mace:incommon",
                 publication_id: "i2lkd9c"
               }
             )

    end

  end


end
