defmodule SmeeViewTest do
  use ExUnit.Case
  doctest SmeeView

  test "greets the world" do
    assert SmeeView.hello() == :world
  end
end
