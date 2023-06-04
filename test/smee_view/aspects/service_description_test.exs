defmodule SmeeViewAspectsServiceDescriptionTest do
  use ExUnit.Case

  alias SmeeView.Aspects.ServiceDescription, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               text: "Service Description",
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "Service Description",
               }
             )

    end
  end

end
