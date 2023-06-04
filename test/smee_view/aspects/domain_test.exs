defmodule SmeeViewAspectsDomainTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Domain, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               domain: "example.com",
             } = ThisAspect.new(
               %{
                 domain: "example.com",
               }
             )

    end
  end
end
