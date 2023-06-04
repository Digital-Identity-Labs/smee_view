defmodule SmeeViewAspectsServiceNameTest do
  use ExUnit.Case

  alias SmeeView.Aspects.ServiceName, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               text: "Service name",
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "Service name",
               }
             )

    end
  end

end
