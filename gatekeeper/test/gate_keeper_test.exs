defmodule GateKeeperTest do
  use ExUnit.Case
  doctest GateKeeper

  test "greets the world" do
    assert GateKeeper.hello() == :world
  end
end
