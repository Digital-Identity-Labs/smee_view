defmodule SmeeViewScopesTest do
  use ExUnit.Case

  alias SmeeView.Scopes, as: ThisView
  alias SmeeView.Aspects.Scope, as: ThisAspect

  #@src_entity ExampleEntities.ukamf_test()
   #@src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  #@src_md_ids Metadata.entity_ids(@src_md)

  describe "Metadata aspect extraction smoketest" do

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %ThisAspect{} = ThisView.view_one(@src_md)
    end

  end


end
