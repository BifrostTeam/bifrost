defmodule RouteBotTest do
  use ExUnit.Case
  doctest RouteBot

  test "greets the world" do
    assert RouteBot.hello() == :world
  end
end
