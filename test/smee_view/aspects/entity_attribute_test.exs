defmodule SmeeViewAspectsEntityAttributeTest do
  use ExUnit.Case

  alias SmeeView.Aspects.EntityAttribute, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               name: "http://macedir.org/entity-category-support",
               values: ["http://refeds.org/category/research-and-scholarship"]
             } = ThisAspect.new(
               %{
                 name: "http://macedir.org/entity-category-support",
                 values: ["http://refeds.org/category/research-and-scholarship"]
               }
             )

    end

  end

end
