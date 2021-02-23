defmodule Danpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Danpay.Repo,
      # Start the Telemetry supervisor
      DanpayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Danpay.PubSub},
      # Start the Endpoint (http/https)
      DanpayWeb.Endpoint
      # Start a worker by calling: Danpay.Worker.start_link(arg)
      # {Danpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Danpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DanpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
