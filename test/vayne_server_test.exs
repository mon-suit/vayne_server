defmodule VayneServerTest do
  use ExUnit.Case
  doctest VayneServer

  test "greets the world" do
    assert VayneServer.hello() == :world
  end
end
