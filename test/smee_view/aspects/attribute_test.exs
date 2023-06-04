defmodule SmeeViewAspectsAttributeTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Attribute, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               friendly_name: "mail",
               name: "urn:mace:dir:attribute-def:mail",
               name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
               values: []
             } = ThisAspect.new(
               %{
                 friendly_name: "mail",
                 name: "urn:mace:dir:attribute-def:mail",
                 name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
               }
             )

    end

  end

end
