defmodule Main.Supervisor do
  @moduledoc """
  Основной супервизор. Следит за всеми серверами
  """
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: :main_supervisor)
  end

  def init(_) do
    children = [
      worker(Main.Server, [] , restart: :temporary)
    ]

    supervise(children, strategy: :one_for_one, max_restarts: 10000, max_seconds: 1)
  end
end