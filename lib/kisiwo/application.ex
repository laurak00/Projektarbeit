defmodule Kisiwo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KisiwoWeb.Telemetry,
      Kisiwo.Repo,
      {DNSCluster, query: Application.get_env(:kisiwo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Kisiwo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Kisiwo.Finch},
      # Start a worker by calling: Kisiwo.Worker.start_link(arg)
      # {Kisiwo.Worker, arg},
      # Start to serve requests, typically the last entry
      KisiwoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kisiwo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KisiwoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
