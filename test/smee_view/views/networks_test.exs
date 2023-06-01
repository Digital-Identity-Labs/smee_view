defmodule SmeeViewXTest do
  use ExUnit.Case

  alias Smee.Entity
  alias Smee.Metadata
  alias SmeeView.Aspects
  alias SmeeView.XXX, as: ThisView

  @src_entity ExampleEntities.ukamf_test()
  @src_entity_id @src_entity.uri

  @src_md ExampleMetadata.aggregate()
  @src_md_ids Metadata.entity_ids(@src_md)




end
