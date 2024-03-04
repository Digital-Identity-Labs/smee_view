defmodule SmeeViewEntitiesTest do
  use ExUnit.Case

  alias SmeeView.Aspects
  alias SmeeView.Entities, as: ThisView

  @src_entity ExampleEntities.ukamf_test()
  @src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  #@src_md_ids Metadata.entity_ids(@src_md)

  describe "view/2" do

    test "should parse a Smee.Entity struct and return a list containing an Entity aspect" do
      entity_id = @src_entity_id
      assert [%Aspects.Entity{entity_id: ^entity_id}] = ThisView.view(@src_entity)
    end

    test "should parse a Smee.Metadata struct and return a list containing Entity aspects" do
      assert [
               %Aspects.Entity{entity_id: "https://test.ukfederation.org.uk/entity"},
               %Aspects.Entity{entity_id: "https://indiid.net/idp/shibboleth"}
             ] = ThisView.view(@src_md)
    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a list containing Entity aspects" do
      assert [
               %Aspects.Entity{entity_id: "https://test.ukfederation.org.uk/entity"},
               %Aspects.Entity{entity_id: "https://indiid.net/idp/shibboleth"},
               %Aspects.Entity{entity_id: "https://test.ukfederation.org.uk/entity"},
             ] = ThisView.view([@src_md, @src_entity])
    end

  end

  describe "view_one/2" do

    test "should parse a Smee.Entity struct and an Entity aspect" do
      entity_id = @src_entity_id
      assert %Aspects.Entity{entity_id: ^entity_id} = ThisView.view_one(@src_entity)
    end

    test "should parse a Smee.Metadata struct and return one random Entity aspect" do
      assert %Aspects.Entity{} = ThisView.view_one(@src_md)
    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return one Entity aspect" do
      assert  %Aspects.Entity{}
              = ThisView.view_one([@src_md, @src_entity])
    end

    #########

    test "entity_id_hash has is set from the original Entity" do
      %Aspects.Entity{entity_id_hash: "c0045678aa1b1e04e85d412f428ea95d2f627255"} = ThisView.view_one(@src_entity)
    end

    test "id is set from the original Entity" do
      %Aspects.Entity{id: "e123456"} = struct(ThisView.view_one(@src_entity), %{id: "e123456"})
      %Aspects.Entity{id: nil} = ThisView.view_one(@src_entity)
    end

    test "valid_until is set from the original Entity, as a DateTime" do
      %Aspects.Entity{valid_until: ~U[2022-01-01 16:22:44.834Z]} = ThisView.view_one(@src_entity)
    end

    test "modified_at is set from the original Entity, as a DateTime" do
      %Aspects.Entity{modified_at: ~U[2023-04-26 10:36:51Z]} = struct(ThisView.view_one(@src_entity), %{modified_at: ~U[2023-04-26 10:36:51Z]})
    end

    test "downloaded_at is set from the original Entity, as a DateTime" do
      %Aspects.Entity{downloaded_at: ~U[2024-03-04 11:10:40.308331Z]} = struct(ThisView.view_one(@src_entity), %{downloaded_at: ~U[2024-03-04 11:10:40.308331Z]})
    end

    test "priority is set from the original Entity, as an integer" do
      %Aspects.Entity{priority: 8} = struct(ThisView.view_one(@src_entity), %{priority: 8})
    end

    test "trustiness is set from the original Entity, as a float" do
      %Aspects.Entity{trustiness: 0.8} = struct(ThisView.view_one(@src_entity), %{trustiness: 0.8})
    end

    test "tags is set from the original Entity, as a list of binaries (or empty)" do
      %Aspects.Entity{tags: ["bar", "foo"]} = struct(ThisView.view_one(@src_entity), %{tags: ["bar", "foo"]})
    end

    test "label is set from the original Entity" do
      %Aspects.Entity{label: "A label"} = struct(ThisView.view_one(@src_entity), %{label: "A label"})
    end

    test "entity_id from XML must match the uri field in the originating entity" do
      assert_raise RuntimeError, fn -> ThisView.view_one(struct(@src_entity, %{uri: "http://example.com"})) end
    end

  end

  describe "prism/2" do

    test "should parse a Smee.Entity struct and return a map with an entity ID key mapped to a list of one Entity aspect" do

      assert %{
               "https://test.ukfederation.org.uk/entity" => [%Aspects.Entity{
                 entity_id: "https://test.ukfederation.org.uk/entity"
               }]
             } = ThisView.prism(@src_entity)
    end

    test "should parse a Smee.Metadata struct and return a map with entity ID keys mapped to a list of one Entity aspect" do


      assert %{
               "https://test.ukfederation.org.uk/entity" => [
                 %Aspects.Entity{entity_id: "https://test.ukfederation.org.uk/entity"}
               ],
               "https://indiid.net/idp/shibboleth" => [%Aspects.Entity{entity_id: "https://indiid.net/idp/shibboleth"}]
             } = ThisView.prism(@src_md)

    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a map with entity ID keys mapped to a list of one Entity aspect" do
      assert %{
               "https://test.ukfederation.org.uk/entity" => [
                 %Aspects.Entity{entity_id: "https://test.ukfederation.org.uk/entity"}
               ],
               "https://indiid.net/idp/shibboleth" => [%Aspects.Entity{entity_id: "https://indiid.net/idp/shibboleth"}]
             } = ThisView.prism([@src_md, @src_entity])
    end

  end


end
