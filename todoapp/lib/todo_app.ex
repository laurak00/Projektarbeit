defmodule TodoApp do
  use Application
    def start(_type, _args) do
    children = [
        {TodoApp.Repo, []}
    ]
    opts = [strategy: :one_for_one, name: TodoApp.Supervisor]
    Supervisor.start_link(children, opts)
 end
  @moduledoc """
  Documentation for `TodoApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TodoApp.hello()
      :world

  """
  def hello do
    :world
  end
end
