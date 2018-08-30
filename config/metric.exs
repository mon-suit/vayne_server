use Mix.Config

config :vayne_export_openfalcon, :openfalcon_metric_specs, self_metric: %{ "type_counter" => ~w(load_task) }

import_config "metric/*.exs"
