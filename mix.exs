defmodule VayneServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :vayne_server,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Vayne.Server.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cipher, "~> 1.4"},
      {:quantum, "~> 2.2"},
      {:folsom, "~> 0.8.5"},
      {:distillery, "~> 1.5"},
      {:libcluster, "~> 2.3"},
      {:logger_file_backend, "~> 0.0.10"},
      {:vayne,                   github: "mon-suit/vayne_core"},
      {:vayne_metric_aws,        github: "mon-suit/vayne_metric_aws"},
      {:vayne_metric_txy,        github: "mon-suit/vayne_metric_txy"},
      {:vayne_metric_ksy,        github: "mon-suit/vayne_metric_ksy"},
      {:vayne_metric_aliyun,     github: "mon-suit/vayne_metric_aliyun"},
      {:vayne_metric_http,       github: "mon-suit/vayne_metric_http"},
      {:vayne_metric_mysql,      github: "mon-suit/vayne_metric_mysql"},
      {:vayne_metric_redis,      github: "mon-suit/vayne_metric_redis"},
      {:vayne_metric_mongodb,    github: "mon-suit/vayne_metric_mongodb"},
      {:vayne_metric_memcache,   github: "mon-suit/vayne_metric_memcache"},
      {:vayne_export_openfalcon, github: "mon-suit/vayne_export_openfalcon"},
    ]
  end
end
