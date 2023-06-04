defmodule SmeeViewViewCommonTest do
  use ExUnit.Case

  alias Smee.Entity
  alias Smee.Metadata
  alias SmeeView.Aspects
  alias SmeeView.RequestedAttributes, as: ThisView
  alias SmeeView.Aspects.RequestedAttribute, as: ThisAspect

  @src_entity ExampleEntities.ukamf_test()
  @src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  @src_md_ids Metadata.entity_ids(@src_md)

  describe "view/2" do

    test "should parse a Smee.Entity struct and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      assert ^expected_results = ThisView.view(@src_entity) |> Enum.sort()
    end

    test "should parse a Smee.Metadata struct and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      results = ThisView.view(@src_md) |> Enum.sort()
      assert Enum.all?(results, fn v -> %ThisAspect{} = v end)
      assert ^results = expected_results |> Enum.sort()
    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      results = ThisView.view([@src_md, @src_entity]) |> Enum.sort()
      assert Enum.all?(results, fn v -> %ThisAspect{} = v end)
      assert ^results = expected_results |> Enum.sort()
    end

  end
#
#  describe "view_one/2" do
#
#    test "should parse a Smee.Entity struct and an Entity aspect and return a single suitable aspect" do
#      assert %ThisAspect{} = ThisView.view_one(@src_entity)
#    end
#
#    test "should parse a Smee.Metadata struct and return a single suitable aspect" do
#      assert %ThisAspect{} = ThisView.view_one(@src_md)
#    end
#
#    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a single suitable aspect" do
#      assert  %ThisAspect{} = ThisView.view_one([@src_md, @src_entity])
#    end
#
#  end
#
#  describe "prism/2" do
#
#    test "should parse a Smee.Entity struct and return a map with an entity ID key mapped to a list of one Entity aspect" do
#
#      assert %{
#               "https://test.ukfederation.org.uk/entity" => [%ThisAspect{}]
#             } = ThisView.prism(@src_entity)
#    end
#
#    test "should parse a Smee.Metadata struct and return a map with entity ID keys mapped to a list of one Entity aspect" do
#
#
#      assert %{
#               "https://test.ukfederation.org.uk/entity" => [
#                 %ThisAspect{}
#               ],
#               "https://indiid.net/idp/shibboleth" => [%ThisAspect{}]
#             } = ThisView.prism(@src_md)
#
#    end
#
#    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a map with entity ID keys mapped to a list of one Entity aspect" do
#      %{
#        "https://test.ukfederation.org.uk/entity" => list1,
#        "https://indiid.net/idp/shibboleth" => list2
#      } = ThisView.prism([@src_md, @src_entity])
#
#
#      assert is_list(list1) and is_list(list2)
#      assert %ThisAspect{} = List.first(list1)
#
#    end
#
#  end

end
