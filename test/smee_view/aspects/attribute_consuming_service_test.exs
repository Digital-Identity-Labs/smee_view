defmodule SmeeViewAspectsAttributeConsumingServiceTest do
  use ExUnit.Case

  alias SmeeView.Aspects.AttributeConsumingService, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do

      assert %ThisAspect{
               default: true,
               index: 0,
               requested_attributes: [],
               service_descriptions: [],
               service_names: []
             } = ThisAspect.new(
               %{
                 default: "true",
                 index: "0"
               }
             )

    end

  end

end
