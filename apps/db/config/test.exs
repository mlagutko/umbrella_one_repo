use Mix.Config

config :db, Db.Repo,
  pool: Ecto.Adapters.SQL.Sandbox
