defmodule Main.Server do
  @moduledoc """
  OTP сервер главного оператора
  """
  use GenServer

  # API
  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :main_server)
  end
  def get_state() do
    GenServer.call(:main_server, :get_state)
  end
  def set_state(state) do
    GenServer.call(:main_server, {:set_state, state})
  end

  # SERVER
  def init(_opts) do
    {:ok, %{}}
  end
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end
  def handle_call({:set_state, state}, _from, _state) do
    {:reply, :ok, state}
  end
  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end
  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end