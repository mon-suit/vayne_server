use Mix.Config

config :vayne_metric_aliyun, rds_metric: ~w(
  CpuUsage DiskUsage IOPSUsage ConnectionUsage
  MemoryUsage MySQL_NetworkInNew MySQL_NetworkOutNew
  SQLServer_NetworkInNew SQLServer_NetworkOutNew
)
