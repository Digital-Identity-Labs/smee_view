defmodule SmeeViewIdPsTest do
  use ExUnit.Case

  alias SmeeView.IdPs, as: ThisView
  alias SmeeView.Aspects.IdP, as: ThisAspect

  ##@src_entity ExampleEntities.ukamf_test()
   #@src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  ##@src_md_ids Metadata.entity_ids(@src_md)

  @proxy_xml File.read! "test/support/static/cern.xml"
  @proxy_entity Smee.Entity.new(@proxy_xml)

  describe "Metadata aspect extraction smoketest" do

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %ThisAspect{} = ThisView.view_one(@src_md)
    end

    test "should not accidentally show requested attributes as IdP-provided attributes" do
      assert %ThisAspect{attributes: []} = ThisView.view_one(@proxy_entity)
    end

  end



end
