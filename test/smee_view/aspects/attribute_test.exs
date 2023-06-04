defmodule SmeeViewAspectsAttributeTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Attribute, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               friendly_name: nil,
               name: nil,
               name_format: nil,
               values: []
             } = ThisAspect.new(
               %{
                 friendly_name: nil,
                 name: nil,
                 name_format: nil,
                 values: []
               }
             )

    end

  end

end
