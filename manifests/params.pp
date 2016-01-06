# == Class kafka::params
#
# This class is meant to be called from kafka.
# It sets variables according to platform.
#
class kafka::params {
  $service_name                                   = 'kafka'
  $package_name                                   = 'kafka'
  $install_java                                   = true
  $java_package                                   = 'java-1.8.0-openjdk'
  $install_service                                = true
  $restart_on_change                              = false
  $manage_service                                 = true
  $manage_repo                                    = true
  $reponame                                       = ''
  $repourl                                        = ''
  $repodescr                                      = ''
  $zookeeper_connect                              = []
  $max_nofiles                                    = '65535'
  $log_dirs                                       = '/tmp/kafka-logs'
  $app_log_dir                                    = '/var/log/kafka'
  $conf_dir                                       = '/etc/kafka'
  $jvm_heap_mem                                   = '-Xmx1G -Xms1G'
  $jvm_perf_opts                                  = '-XX:PermSize=48m -XX:MaxPermSize=48m -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35'
  $jmx_opts                                       = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.net.preferIPv4Stack=true -Dcom.sun.management.jmxremote.port=9999'
  $log4j_opts                                     = "-Dlog4j.configuration=file:${conf_dir}/log4j.properties"
  $broker_id                                      = '1'
  $port                                           = '9092'
  $message_max_bytes                              = '1000000'
  $num_network_threads                            = '3'
  $num_io_threads                                 = '8'
  $background_threads                             = '4'
  $queued_max_requests                            = '500'
  $socket_send_buffer_bytes                       = '102400'
  $socket_receive_buffer_bytes                    = '102400'
  $socket_request_max_bytes                       = '104857600'
  $num_partitions                                 = '1'
  $log_segment_bytes                              = '1073741824'
  $log_roll_hours                                 = '168'
  $log_cleanup_policy                             = 'delete'
  $log_retention_hours                            = '168'
  $log_retention_minutes                          = '10080'
  $log_retention_bytes                            = '-1'
  $log_retention_check_interval_ms                = '300000'
  $log_cleaner_enable                             = false
  $log_cleaner_threads                            = '1'
  $log_cleaner_dedupe_buffer_size                 = '524288000'
  $log_cleaner_io_buffer_size                     = '524288'
  $log_cleaner_io_buffer_load_factor              = '0.9'
  $log_cleaner_backoff_ms                         = '15000'
  $log_cleaner_min_cleanable_ratio                = '0.5'
  $log_cleaner_delete_retention_ms                = '86400000'
  $log_index_size_max_bytes                       = '10485760'
  $log_index_interval_bytes                       = '4096'
  $log_flush_interval_messages                    = '10000'
  $log_flush_scheduler_interval_ms                = '3000'
  $log_flush_interval_ms                          = '3000'
  $log_flush_offset_checkpoint_interval_ms        = '60000'
  $auto_create_topics_enable                      = true
  $controller_socket_timeout_ms                   = '30000'
  $controller_message_queue_size                  = '10'
  $default_replication_factor                     = '1'
  $replica_lag_time_max_ms                        = '10000'
  $replica_socket_timeout_ms                      = '301000'
  $replica_socket_receive_buffer_bytes            = '641024'
  $replica_fetch_max_bytes                        = '10241024'
  $replica_fetch_wait_max_ms                      = '500'
  $replica_fetch_min_bytes                        = '1'
  $num_replica_fetchers                           = '1'
  $replica_high_watermark_checkpoint_interval_ms  = '5000'
  $fetch_purgatory_purge_interval_requests        = '10000'
  $producer_purgatory_purge_interval_requests     = '10000'
  $zookeeper_session_timeout_ms                   = '6000'
  $zookeeper_connection_timeout_ms                = '6000'
  $zookeeper_sync_time_ms                         = '2000'
  $controlled_shutdown_enable                     = true
  $controlled_shutdown_max_retries                = '3'
  $controlled_shutdown_retry_backoff_ms           = '5000'
  $auto_leader_rebalance_enable                   = true
  $leader_imbalance_per_broker_percentage         = '10'
  $leader_imbalance_check_interval_seconds        = '300'
  $offset_metadata_max_bytes                      = '1024'
  $delete_topic_enable                            = false
  $num_recovery_threads_per_data_dir              = '1'
}
