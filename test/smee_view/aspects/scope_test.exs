defmodule SmeeViewAspectsScopeTest do
  use ExUnit.Case


  alias SmeeView.Aspects.Scope, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               regex: false,
               domain: "example.com"
             } = ThisAspect.new(
               %{
                 regex: "false",
                 domain: "example.com"
               }
             )

    end

  end

end
