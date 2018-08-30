use Mix.Config

config :vayne_metric_ksy, krds_metric: ~w(
    rds.wbps rds.wiops rds.riops rds.rbps
    rds.resident_memory_size rds.connection_used_percent rds.space_used_percent
)
