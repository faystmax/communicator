defmodule App do
  @moduledoc """
  Главное приложение. Запускает супервизор при старте
  """

  use Application

  def start(_type, _args) do
    Main.Supervisor.start_link()
  end
end