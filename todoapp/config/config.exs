import Config

config :todoapp, ecto_repos: [TodoApp.Repo],
  #:todoapp, TodoApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "laura",
  password: "hello",
  hostname: "localhost",
  database: "postgres"
