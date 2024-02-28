defmodule SmeeViewProtocolsTest do
  use ExUnit.Case

  alias SmeeView.Protocols, as: ThisView
  alias SmeeView.Aspects.Protocol, as: ThisAspect

  #@src_entity ExampleEntities.ukamf_test()
   #@src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  #@src_md_ids Metadata.entity_ids(@src_md)

  describe "Metadata aspect extraction smoketest" do

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %ThisAspect{} = ThisView.view_one(@src_md)
    end

  end

  describe "view_one/3" do

    test "should parse a Smee.Metadata struct and return a single suitable aspect if data can be found" do
      assert %SmeeView.Aspects.Protocol{uri: "urn:oasis:names:tc:SAML:2.0:protocol", role: :sp} = ThisView.view_one(@src_md)
    end

  end

  describe "view/3" do

    test "should return a list of protocol aspects from metadata" do
      assert is_list(ThisView.view(@src_md))
      assert Enum.all?(ThisView.view(@src_md), fn a -> is_struct(a, ThisAspect) end)
    end

    test "protocols should be separate URIs, each in a struct" do
      assert [
               %SmeeView.Aspects.Protocol{role: :sp, uri: "urn:oasis:names:tc:SAML:2.0:protocol"},
               %SmeeView.Aspects.Protocol{role: :sp, uri: "urn:oasis:names:tc:SAML:1.1:protocol"},
               %SmeeView.Aspects.Protocol{role: :sp, uri: "urn:oasis:names:tc:SAML:1.0:protocol"},
               %SmeeView.Aspects.Protocol{role: :idp, uri: "urn:mace:shibboleth:1.0"},
               %SmeeView.Aspects.Protocol{role: :idp, uri: "urn:oasis:names:tc:SAML:1.1:protocol"},
               %SmeeView.Aspects.Protocol{role: :idp, uri: "urn:oasis:names:tc:SAML:2.0:protocol"}
             ] = ThisView.view(@src_md)
    end

  end

  describe "prism/3" do

    test "should return a map of Entity IDs to protocol aspects" do
      assert %{} = ThisView.prism(@src_md)
    end

  end

end
