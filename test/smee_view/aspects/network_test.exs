defmodule SmeeViewAspectsNetworkTest do
  use ExUnit.Case

  alias SmeeView.Aspects.Network, as: ThisAspect

  describe "new/2" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               network: "192.168.0.0/16",
             } = ThisAspect.new(
               %{
                 network: "192.168.0.0/16",
               }
             )

    end
  end

end
