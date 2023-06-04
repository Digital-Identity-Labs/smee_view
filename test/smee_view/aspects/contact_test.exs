defmodule SmeeViewAspectsContactTest do
  use ExUnit.Case


  alias SmeeView.Aspects.Contact, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               type: "technical",
               givenname: "Support",
               email: "support@digitalidentitylabs.com",
               phone: nil,
               surname: nil,
               company: nil
             } = ThisAspect.new(
               %{
                 type: "technical",
                 givenname: "Support",
                 email: "mailto:support@digitalidentitylabs.com"
               }
             )

    end

  end

end
