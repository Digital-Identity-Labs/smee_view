defmodule SmeeViewAspectsRegistrationPolicyTest do
  use ExUnit.Case


  alias SmeeView.Aspects.RegistrationPolicy, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               lang: "en",
               url: "http://www.incommonfederation.org/metadata/en_registration.html"
             } = ThisAspect.new(
               %{
                 lang: "en",
                 url: "http://www.incommonfederation.org/metadata/en_registration.html"
               }
             )

    end

  end


end
