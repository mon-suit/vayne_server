defmodule Vayne.Server.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Vayne.Server.Metric.init_metrics()

    children = [
      worker(Vayne.Server.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: Vayne.Server.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
