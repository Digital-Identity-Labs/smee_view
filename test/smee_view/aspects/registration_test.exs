defmodule SmeeViewAspectsRegistrationTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Registration, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               authority: "http://ukfederation.org.uk",
               instant: "2014-11-07T16:35:40Z",
               policies: []
             } = ThisAspect.new(
               %{
                 authority: "http://ukfederation.org.uk",
                 instant: "2014-11-07T16:35:40Z",
               }
             )

    end
  end
end
