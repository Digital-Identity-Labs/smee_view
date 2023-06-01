defmodule SmeeViewEntitiesTest do
  use ExUnit.Case
  doctest SmeeView

  alias Smee.Entity
  alias Smee.Metadata
  alias SmeeView.Aspects
  alias SmeeView.Entities, as: ThisView

  @src_entity ExampleEntities.ukamf_test()
  @src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  @src_md_ids Metadata.entity_ids(@src_md)

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
