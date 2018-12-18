defmodule App do
  alias Main.Couch.Base, as: Base
  @moduledoc """
  Главное приложение. Запускает супервизор при старте
  """

  use Application

  def start(_type, _args) do
    Main.Supervisor.start_link()
    Base.init_()
    dbs = Base.get_dbs()
    dbs
  end
end