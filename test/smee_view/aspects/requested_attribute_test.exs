defmodule SmeeViewAspectsRequestedAttributeTest do
  use ExUnit.Case

  alias SmeeView.Aspects.RequestedAttribute, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               friendly_name: "eduPersonTargetedID",
               name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.10",
               name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri"
             } = ThisAspect.new(
               %{
                 friendly_name: "eduPersonTargetedID",
                 name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.10",
                 name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri"
               }
             )

    end

  end
end
