use Mix.Config

config :vayne_metric_txy, mysql_metric: ~w(
    volume_rate real_capacity capacity query_rate qps tps
    cpu_use_rate memory_use
)

config :vayne_metric_txy, redis_metric: ~w(cpu_us in_flow out_flow storage_us)
