defmodule BifrostTest do
  use ExUnit.Case
  doctest Bifrost

  test "greets the world" do
    assert Bifrost.hello() == :world
  end
end
