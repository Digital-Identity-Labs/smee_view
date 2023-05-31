defmodule SmeeViewAspectsDisplaynameTest do
  use ExUnit.Case
  doctest SmeeView

 # use AspectTextSharedTests, aspect: true

 Apex.ap AspectFixtures.fixtures(SmeeView.Aspects.Displayname, [%{lang: "en", text: "aha"}])


end
