defmodule App do
  alias Main.Couch.Base, as: Base
  @moduledoc """
  Главное приложение. Запускает супервизор и инициализирует БД при старте
  """

  use Application

  def start(_type, _args) do
    Base.init_()
    Main.Supervisor.start_link()
  end
end