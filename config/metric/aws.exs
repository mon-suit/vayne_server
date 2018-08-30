use Mix.Config

config :vayne_metric_aws, rds_metric: ~w(
  ActiveTransactions AuroraBinlogReplicaLag BinLogDiskUsage BlockedTransactions
  BufferCacheHitRatio CommitLatency CommitThroughput CPUUtilization DatabaseConnections
  DDLLatency DDLThroughput Deadlocks DeleteLatency DeleteThroughput DiskQueueDepth
  DMLLatency DMLThroughput EngineUptime FreeableMemory FreeLocalStorage FreeStorageSpace
  InsertLatency InsertThroughput LoginFailures NetworkReceiveThroughput NetworkThroughput
  NetworkTransmitThroughput OldestReplicationSlotLag Queries ReadIOPS ReadLatency
  ReadThroughput ReplicationSlotDiskUsage ResultSetCacheHitRatio SelectLatency SelectThroughput
  SwapUsage TransactionLogsDiskUsage TransactionLogsGeneration UpdateLatency UpdateThroughput
  WriteIOPS WriteLatency WriteThroughput
)

config :vayne_metric_aws, elb_metric: ~w(
  UnHealthyHostCount Latency RequestCount
  HTTPCode_ELB_4XX HTTPCode_ELB_5XX HTTPCode_Backend_2XX
  HTTPCode_Backend_3XX HTTPCode_Backend_4XX HTTPCode_Backend_5XX
)

config :vayne_metric_aws, elasticache_metric: ~w(
  BytesUsedForCache CacheHits CacheMisses
  Reclaimed ReplicationBytes ReplicationLag
  SaveInProgress CasHits CasMisses
  CPUUtilization SwapUsage FreeableMemory
  NetworkBytesIn NetworkBytesOut CurrItems
  CurrConnections Evictions NewConnections
)
