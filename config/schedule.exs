use Mix.Config

if Mix.env == :prod do
  config :vayne_server, Vayne.Server.Scheduler,
    global: false,
    jobs: [
      load_task: [
        schedule: "*/3 * * * *",               # Every 3 minutes
        task: {Vayne.Server, :load_task, []},
        run_strategy: Quantum.RunStrategy.Local
      ],
      start_load_task: [
        schedule: "@reboot",                   # Restart
        task: {Vayne.Server, :load_task, []},
        run_strategy: Quantum.RunStrategy.Local
      ],
      update_metrics: [
        schedule: {:extended, "*/10"},         # Every 20 seconds
        task: {Vayne.Server.Metric, :update_metrics, []},
        run_strategy: Quantum.RunStrategy.Local
      ],
      report_metrics: [
        schedule: {:extended, "*/60"},         # Every 60 seconds
        task: {Vayne.Server.Metric, :report_metrics, []},
        run_strategy: Quantum.RunStrategy.Local
      ],
    ]
end
