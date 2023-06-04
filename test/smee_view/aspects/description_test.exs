defmodule SmeeViewAspectsDescriptionTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Description, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               text: "v-scene enables you to launch or schedule H323 and Desktop videoconferences, record, stream and add guests.",
               role: :sp
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "v-scene enables you to launch or schedule H323 and Desktop videoconferences, record, stream and add guests.",
                 role: :sp
               }
             )

    end

  end
end
