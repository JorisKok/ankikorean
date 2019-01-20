defmodule Ankikorean.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(AnkikoreanWeb.Endpoint, []),
      # Other workers
      worker(Ankikorean.Cache, [[name: Ankikorean.Cache]]),
      worker(Ankikorean.ChineseCache, [[name: Ankikorean.ChineseCache]]),
#      worker(Ankikorean.Scheduler, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ankikorean.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AnkikoreanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
