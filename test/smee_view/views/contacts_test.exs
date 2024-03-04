defmodule SmeeViewContactsTest do
  use ExUnit.Case

  alias SmeeView.Contacts, as: ThisView
  alias SmeeView.Aspects.Contact, as: ThisAspect

  #@src_entity ExampleEntities.ukamf_test()
  #@src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  #@src_md_ids Metadata.entity_ids(@src_md)

  @proxy_xml File.read! "test/support/static/cern.xml"
  @proxy_entity Smee.Entity.new(@proxy_xml)

  describe "Metadata aspect extraction smoketest" do

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %ThisAspect{} = ThisView.view_one(@src_md)
    end

    test "should be able to extract new other/security type" do
      assert %ThisAspect{rtype: "http://refeds.org/metadata/contactType/security"} = ThisView.view(@proxy_entity)
                                                                                     |> List.last()

    end

  end


end
