defmodule SmeeViewViewCommonTest do
  use ExUnit.Case

  alias SmeeView.RequestedAttributes, as: ThisView
  alias SmeeView.Aspects.RequestedAttribute, as: ThisAspect

  @src_entity ExampleEntities.ukamf_test()
   #@src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  #@src_md_ids Metadata.entity_ids(@src_md)

  @src_entity_empty ExampleEntities.indiid()

  describe "view/2" do

    test "should parse a Smee.Entity struct and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      assert ^expected_results = ThisView.view(@src_entity)
                                 |> Enum.sort()
    end

    test "should parse a Smee.Entity struct with no relevant data and return an empty list" do
      assert [] = ThisView.view(@src_entity_empty)
    end

    test "should parse a Smee.Metadata struct and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      results = ThisView.view(@src_md)
                |> Enum.sort()
      assert Enum.all?(results, fn v -> %ThisAspect{} = v end)
      assert ^results = expected_results
                        |> Enum.sort()
    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a list containing suitable aspects" do
      expected_results = AspectFixtures.ukamf_requested_attributes()
      results = ThisView.view([@src_md, @src_entity])
                |> Enum.sort()
      assert Enum.all?(results, fn v -> %ThisAspect{} = v end)
      assert ^results = expected_results
                        |> Enum.sort()
    end

  end

  describe "view_one/2" do

    test "should parse a Smee.Entity struct and return a single suitable aspect (if available)" do
      assert %ThisAspect{} = ThisView.view_one(@src_entity)
    end

    test "should parse a Smee.Entity struct and return nil if no data can be found" do
      assert nil == ThisView.view_one(@src_entity_empty)
    end

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %ThisAspect{} = ThisView.view_one(@src_md)
    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a single suitable aspect if data can be found" do
      assert  %ThisAspect{} = ThisView.view_one([@src_md, @src_entity])
    end

  end

  describe "prism/2" do

    test "should parse a Smee.Entity struct and return a map with an entity ID key mapped to a list aspects" do

      expected_attrs = AspectFixtures.ukamf_requested_attributes()
                       |> Enum.sort()

      %{"https://test.ukfederation.org.uk/entity" => actual_attrs} = ThisView.prism(@src_entity)

      assert ^expected_attrs = actual_attrs
                               |> Enum.sort()

    end

    test "should parse a Smee.Entity struct with no usable data and return a map with an entity ID key mapped to an empty list" do

      assert %{
               "https://indiid.net/idp/shibboleth" => []
             } == ThisView.prism(@src_entity_empty)
    end

    test "should parse a Smee.Metadata struct and return a map with entity ID keys mapped to a list of one Entity aspect" do

      expected_attrs = AspectFixtures.ukamf_requested_attributes()
                       |> Enum.sort()

      %{
        "https://test.ukfederation.org.uk/entity" => uk_attrs,
        "https://indiid.net/idp/shibboleth" => ii_attrs
      } = ThisView.prism(@src_md)

      assert ii_attrs == []
      assert Enum.all?(uk_attrs, fn v -> %ThisAspect{} = v end)
      assert expected_attrs == uk_attrs
                               |> Enum.sort()

    end

    test "should parse a list of Smee.Entity and Smee.Metadata structs and return a map with entity ID keys mapped to a list of one Entity aspect" do

      expected_attrs = AspectFixtures.ukamf_requested_attributes()
                       |> Enum.sort()

      %{
        "https://test.ukfederation.org.uk/entity" => uk_attrs,
        "https://indiid.net/idp/shibboleth" => ii_attrs
      } = ThisView.prism([@src_md, @src_entity])

      assert ii_attrs == []
      assert Enum.all?(uk_attrs, fn v -> %ThisAspect{} = v end)
      assert expected_attrs == uk_attrs
                               |> Enum.sort()



    end

  end

end
