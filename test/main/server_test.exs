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

  test "Register phone number with valid phone"  do
    assert Main.Server.register_phone({"+79130214538", 5002}) == :ok
  end

  test "Register phone number with wrong phone"  do
    assert Main.Server.register_phone({"+791252012", 1}) == :error
  end

  test "Register and Check is phone exist"  do
    Main.Server.register_phone({"+79131245721", 102})
    assert Main.Server.is_phone_exist("+79131245721") == :yes
  end
end
