defmodule Main.Couch.Base do
  alias Main.Couch.Db, as: Db

  @moduledoc """
     This module acts as a store for all databases used in an application
     This is as an important persistant data layer
  """

  #call this function on first start up
  def init_() do
    {:ok, db} = Db.init_db(app_name())

    Db.write_document(db, "app", Poison.encode!(%{"list"=>[]}))
  end

  def app_name() do
    Application.get_env(:communicator, :app_name)
  end

  #am i wrong with that getter?
  def app_db() do
    app_name()
    |>Db.db_config()
  end

  def get_dbs() do
    with {:ok, doc} <- Db.get_document(app_db(), "app", "failed to get load type database") do
      {:ok, doc["list"]}
    else
      _ -> {:error, "could not load databases"}
    end
  end

  #we need many types of different databases
  def add_database(type) do
    with {:ok, db} <- Db.init_db(type) do
      app_db()
      |>Db.append_to_document(type, "list", db, "failed to add new database")
    else
      _ -> {:error, "could not add db"}
    end
  end
end