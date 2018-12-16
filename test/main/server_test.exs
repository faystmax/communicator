defmodule Main.ServerTest do
  use ExUnit.Case
  doctest Main.Server

  setup do
    Main.Server.start_link()
    :ok
  end

  test "Change status via handle_call"  do
    Main.Server.set_state(1)
    assert Main.Server.get_state() == 1
  end
end
