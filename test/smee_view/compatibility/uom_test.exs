defmodule SmeeViewCompatibilityUoMTest do
  use ExUnit.Case

  alias ExampleEntities
  alias Smee.Entity
  alias SmeeView.Aspects

  @src_entity ExampleEntities.uom()
  @src_id @src_entity.uri

  describe "Smee.Entity processing with view and prism" do

    test "Entity can be viewed" do
      entity_id = @src_id

      assert [%Aspects.Entity{entity_id: ^entity_id}] = SmeeView.view(@src_entity)

    end

    test "Entity can be view_oned" do
      entity_id = @src_id

      assert %Aspects.Entity{entity_id: ^entity_id} = SmeeView.view_one(@src_entity)

    end

    test "Entity can be prismed" do
      entity_id = @src_id

      assert %{
               ^entity_id => [%Aspects.Entity{
                 entity_id: ^entity_id
               }]
             } = SmeeView.prism(@src_entity)

    end

  end

end
