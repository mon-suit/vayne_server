use Mix.Config

config :vayne_export_openfalcon, :openfalcon_metric_specs, mongodb: %{
  "type_counter" => ~w(
    asserts_msg asserts_regular asserts_rollovers asserts_user asserts_warning page_faults connections_totalCreated
    locks_Global_acquireCount_ISlock locks_Global_acquireCount_IXlock locks_Global_acquireCount_Slock locks_Global_acquireCount_Xlock
    locks_Global_acquireWaitCount_ISlock locks_Global_acquireWaitCount_IXlock locks_Global_timeAcquiringMicros_ISlock
    locks_Global_timeAcquiringMicros_IXlock locks_Database_acquireCount_ISlock locks_Database_acquireCount_IXlock locks_Database_acquireCount_Slock
    locks_Database_acquireCount_Xlock locks_Collection_acquireCount_ISlock locks_Collection_acquireCount_IXlock locks_Collection_acquireCount_Xlock
    opcounters_command opcounters_insert opcounters_delete opcounters_update opcounters_query opcounters_getmore
    opcountersRepl_command opcountersRepl_insert opcountersRepl_delete opcountersRepl_update opcountersRepl_query opcountersRepl_getmore
    network_bytesIn network_bytesOut network_numRequests backgroundFlushing_flushes
    backgroundFlushing_last_ms cursor_timedOut wt_cache_readinto_bytes wt_cache_writtenfrom_bytes
    wt_bm_bytes_read wt_bm_bytes_written wt_bm_blocks_read wt_bm_blocks_written
  ),
  "allow" => ~w(
    mongo.alive repl.role_check repl.members_health repl.myState
    asserts_msg asserts_regular asserts_rollovers asserts_user asserts_warning backgroundFlushing_flushes backgroundFlushing_last_ms
    connections_current connections_totalCreated connections_used_percent cursor_timedOut globalLock_currentQueue_readers
    globalLock_currentQueue_total globalLock_currentQueue_writers locks_Collection_acquireCount_ISlock locks_Collection_acquireCount_IXlock
    locks_Collection_acquireCount_Xlock locks_Database_acquireCount_ISlock locks_Database_acquireCount_IXlock locks_Database_acquireCount_Slock
    locks_Database_acquireCount_Xlock locks_Global_acquireCount_ISlock
    locks_Global_acquireCount_IXlock locks_Global_acquireCount_Slock locks_Global_acquireCount_Xlock locks_Global_acquireWaitCount_ISlock
    locks_Global_acquireWaitCount_IXlock locks_Global_timeAcquiringMicros_ISlock locks_Global_timeAcquiringMicros_IXlock network_bytesIn
    network_bytesOut network_numRequests opcounters_command opcounters_delete opcounters_getmore
    opcounters_insert opcounters_query opcountersRepl_command opcountersRepl_delete opcountersRepl_getmore
    opcountersRepl_insert opcountersRepl_query opcountersRepl_update opcounters_update page_faults
    repl_health replication_lag_percent repl_lag repl_myState repl_oplog_window
    wt_bm_blocks_read wt_bm_blocks_written wt_bm_bytes_read wt_bm_bytes_written wt_cache_readinto_bytes wt_cache_writtenfrom_bytes
  )
}


config :vayne_export_openfalcon, :openfalcon_metric_specs, redis_sentinel: %{
  "allow" => ~w(
    redis_sentinel.alive sentinel_masters sentinel_tilt
    sentinel_running_scripts sentinel_scripts_queue_length
  )
}

config :vayne_export_openfalcon, :openfalcon_metric_specs, redis: %{
  "type_counter" => ~w(total_connections_received),
  "allow" => ~w(
    redis.alive key_hits_percent keys
    is_slave master_link_status aof_last_rewrite_time_sec
    aof_last_bgrewrite_status rdb_last_bgsave_status maxmemory
    used_memory_peak_percent used_memory_percent cluster_state
    connected_clients blocked_clients client_biggest_input_buf client_longest_output_list
    rejected_connections instantaneous_ops_per_sec evicted_keys latest_fork_usec mem_fragmentation_ratio
    used_memory cmdstat_get cmdstat_keys cmdstat_set rdb_last_bgsave_time_sec used_cpu_sys
    used_cpu_user total_connections_received total_net_input_bytes total_net_output_bytes
    instantaneous_input_kbps instantaneous_output_kbps
  )
}

config :vayne_export_openfalcon, :openfalcon_metric_specs, memcache: %{
  "type_counter" => ~w(cmd_get cmd_set cmd_flush),
  "allow" => ~w(
    memcache.alive bytes cmd_get cmd_set cmd_flush
    limit_maxbytes curr_connections used_memory_percent
  )
}

config :vayne_export_openfalcon, :openfalcon_metric_specs, mysql: %{
  "type_counter" => ~w(
    Com_commit Com_insert Com_select Com_delete
    Com_qps Com_tps Com_update
    Connections Created_tmp_disk_tables Select_scan
    Slow_queries Table_locks_waited
  ),
  "allow" => ~w(
    mysql.alive No_slave_status ConnectionPercent Com_commit Com_delete Com_insert Com_qps Com_rollback Com_select
    Com_tps Com_update Connections Created_tmp_disk_tables Innodb_buffer_pool_pages_free
    Innodb_log_waits Queries Seconds_Behind_Master Select_full_join Select_scan
    Slave_IO_Running Slave_SQL_Running Slow_queries Table_locks_waited Threads_connected
    Threads_running
  )
}
