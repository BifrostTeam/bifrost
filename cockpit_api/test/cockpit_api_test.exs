defmodule CockpitApiTest do
  use ExUnit.Case
  doctest CockpitApi

  test "greets the world" do
    assert CockpitApi.hello() == :world
  end
end
