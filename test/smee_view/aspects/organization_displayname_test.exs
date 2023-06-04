defmodule SmeeViewAspectsOrganizationDisplaynameTest do
  use ExUnit.Case

  alias SmeeView.Aspects.OrganizationDisplayname, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               text: "An Organization Name",
             } = ThisAspect.new(
               %{
                 lang: "en",
                 text: "An Organization Name",
               }
             )

    end
  end
end
