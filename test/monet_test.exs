defmodule MonetTest do
  use ExUnit.Case
  doctest Monet

  test "greets the world" do
    assert Monet.hello() == :world
  end
end
