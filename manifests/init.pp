# == Class: kafka
#
# Used to setup, install and intialize a Kafka broker
#
class kafka (
  $app_log_dir                                    = $::kafka::params::app_log_dir,
  $auto_create_topics_enable                      = $::kafka::params::auto_create_topics_enable,
  $auto_leader_rebalance_enable                   = $::kafka::params::auto_leader_rebalance_enable,
  $background_threads                             = $::kafka::params::background_threads,
  $broker_id                                      = $::kafka::params::broker_id,
  $conf_dir                                       = $::kafka::params::conf_dir,
  $controlled_shutdown_enable                     = $::kafka::params::controlled_shutdown_enable,
  $controlled_shutdown_max_retries                = $::kafka::params::controlled_shutdown_max_retries,
  $controlled_shutdown_retry_backoff_ms           = $::kafka::params::controlled_shutdown_retry_backoff_ms,
  $controller_message_queue_size                  = $::kafka::params::controller_message_queue_size,
  $controller_socket_timeout_ms                   = $::kafka::params::controller_socket_timeout_ms,
  $default_replication_factor                     = $::kafka::params::default_replication_factor,
  $delete_topic_enable                            = $::kafka::params::delete_topic_enable,
  $fetch_purgatory_purge_interval_requests        = $::kafka::params::fetch_purgatory_purge_interval_requests,
  $group                                          = $::kafka::params::group,
  $install_java                                   = $::kafka::params::install_java,
  $install_service                                = $::kafka::params::install_service,
  $java_package                                   = $::kafka::params::java_package,
  $jmx_opts                                       = $::kafka::params::jmx_opts,
  $jvm_heap_mem                                   = $::kafka::params::jvm_heap_mem,
  $jvm_perf_opts                                  = $::kafka::params::jvm_perf_opts,
  $leader_imbalance_check_interval_seconds        = $::kafka::params::leader_imbalance_check_interval_seconds,
  $leader_imbalance_per_broker_percentage         = $::kafka::params::leader_imbalance_per_broker_percentage,
  $log_cleaner_backoff_ms                         = $::kafka::params::log_cleaner_backoff_ms,
  $log_cleaner_dedupe_buffer_size                 = $::kafka::params::log_cleaner_dedupe_buffer_size,
  $log_cleaner_delete_retention_ms                = $::kafka::params::log_cleaner_delete_retention_ms,
  $log_cleaner_enable                             = $::kafka::params::log_cleaner_enable,
  $log_cleaner_io_buffer_load_factor              = $::kafka::params::log_cleaner_io_buffer_load_factor,
  $log_cleaner_io_buffer_size                     = $::kafka::params::log_cleaner_io_buffer_size,
  $log_cleaner_min_cleanable_ratio                = $::kafka::params::log_cleaner_min_cleanable_ratio,
  $log_cleaner_threads                            = $::kafka::params::log_cleaner_threads,
  $log_cleanup_policy                             = $::kafka::params::log_cleanup_policy,
  $log_dirs                                       = $::kafka::params::log_dirs,
  $log_flush_interval_messages                    = $::kafka::params::log_flush_interval_messages,
  $log_flush_interval_ms                          = $::kafka::params::log_flush_interval_ms,
  $log_flush_offset_checkpoint_interval_ms        = $::kafka::params::log_flush_offset_checkpoint_interval_ms,
  $log_flush_scheduler_interval_ms                = $::kafka::params::log_flush_scheduler_interval_ms,
  $log_index_interval_bytes                       = $::kafka::params::log_index_interval_bytes,
  $log_index_size_max_bytes                       = $::kafka::params::log_index_size_max_bytes,
  $log_retention_bytes                            = $::kafka::params::log_retention_bytes,
  $log_retention_check_interval_ms                = $::kafka::params::log_retention_check_interval_ms,
  $log_retention_hours                            = $::kafka::params::log_retention_hours,
  $log_retention_minutes                          = $::kafka::params::log_retention_minutes,
  $log_roll_hours                                 = $::kafka::params::log_roll_hours,
  $log_segment_bytes                              = $::kafka::params::log_segment_bytes,
  $log4j_opts                                     = $::kafka::params::log4j_opts,
  $manage_repo                                    = $::kafka::params::manage_repo,
  $manage_service                                 = $::kafka::params::manage_service,
  $max_nofiles                                    = $::kafka::params::max_nofiles,
  $message_max_bytes                              = $::kafka::params::message_max_bytes,
  $num_io_threads                                 = $::kafka::params::num_io_threads,
  $num_network_threads                            = $::kafka::params::num_network_threads,
  $num_partitions                                 = $::kafka::params::num_partitions,
  $num_recovery_threads_per_data_dir              = $::kafka::params::num_recovery_threads_per_data_dir,
  $num_replica_fetchers                           = $::kafka::params::num_replica_fetchers,
  $offset_metadata_max_bytes                      = $::kafka::params::offset_metadata_max_bytes,
  $package_name                                   = $::kafka::params::package_name,
  $port                                           = $::kafka::params::port,
  $producer_purgatory_purge_interval_requests     = $::kafka::params::producer_purgatory_purge_interval_requests,
  $queued_max_requests                            = $::kafka::params::queued_max_requests,
  $replica_fetch_max_bytes                        = $::kafka::params::replica_fetch_max_bytes,
  $replica_fetch_min_bytes                        = $::kafka::params::replica_fetch_min_bytes,
  $replica_fetch_wait_max_ms                      = $::kafka::params::replica_fetch_wait_max_ms,
  $replica_high_watermark_checkpoint_interval_ms  = $::kafka::params::replica_high_watermark_checkpoint_interval_ms,
  $replica_lag_time_max_ms                        = $::kafka::params::replica_lag_time_max_ms,
  $replica_socket_receive_buffer_bytes            = $::kafka::params::replica_socket_receive_buffer_bytes,
  $replica_socket_timeout_ms                      = $::kafka::params::replica_socket_timeout_ms,
  $restart_on_change                              = $::kafka::params::restart_on_change,
  $service_name                                   = $::kafka::params::service_name,
  $socket_receive_buffer_bytes                    = $::kafka::params::socket_receive_buffer_bytes,
  $socket_request_max_bytes                       = $::kafka::params::socket_request_max_bytes,
  $socket_send_buffer_bytes                       = $::kafka::params::socket_send_buffer_bytes,
  $user                                           = $::kafka::params::user,
  $zookeeper_connect                              = $::kafka::params::zookeeper_connect,
  $zookeeper_connection_timeout_ms                = $::kafka::params::zookeeper_connection_timeout_ms,
  $zookeeper_session_timeout_ms                   = $::kafka::params::zookeeper_session_timeout_ms,
  $zookeeper_sync_time_ms                         = $::kafka::params::zookeeper_sync_time_ms
) inherits kafka::params {

  validate_absolute_path($app_log_dir)
  validate_boolean($auto_create_topics_enable)
  validate_boolean($auto_leader_rebalance_enable)
  validate_integer($background_threads)
  validate_integer($broker_id)
  validate_absolute_path($conf_dir)
  validate_boolean($controlled_shutdown_enable)
  validate_integer($controlled_shutdown_max_retries)
  validate_integer($controlled_shutdown_retry_backoff_ms)
  validate_integer($controller_message_queue_size)
  validate_integer($controller_socket_timeout_ms)
  validate_integer($default_replication_factor)
  validate_boolean($delete_topic_enable)
  validate_integer($fetch_purgatory_purge_interval_requests)
  validate_string($group)
  validate_boolean($install_java)
  validate_boolean($install_service)
  validate_string($java_package)
  validate_string($jmx_opts)
  validate_integer($jvm_heap_mem)
  validate_string($jvm_perf_opts)
  validate_string($leader_imbalance_check_interval_seconds)
  validate_numeric($leader_imbalance_per_broker_percentage)
  validate_integer($log_cleaner_backoff_ms)
  validate_integer($log_cleaner_dedupe_buffer_size)
  validate_integer($log_cleaner_delete_retention_ms)
  validate_boolean($log_cleaner_enable)
  validate_numeric($log_cleaner_io_buffer_load_factor)
  validate_integer($log_cleaner_io_buffer_size)
  validate_numeric($log_cleaner_min_cleanable_ratio)
  validate_integer($log_cleaner_threads)
  validate_string($log_cleanup_policy)
  validate_string($log_dirs)
  validate_integer($log_flush_interval_messages)
  validate_integer($log_flush_interval_ms)
  validate_integer($log_flush_offset_checkpoint_interval_ms)
  validate_integer($log_flush_scheduler_interval_ms)
  validate_integer($log_index_interval_bytes)
  validate_integer($log_index_size_max_bytes)
  validate_integer($log_retention_bytes)
  validate_integer($log_retention_check_interval_ms)
  validate_integer($log_retention_hours)
  validate_integer($log_retention_minutes)
  validate_integer($log_roll_hours)
  validate_integer($log_segment_bytes)
  validate_string($log4j_opts)
  validate_boolean($manage_repo)
  validate_boolean($manage_service)
  validate_integer($max_nofiles)
  validate_integer($message_max_bytes)
  validate_integer($num_io_threads)
  validate_integer($num_network_threads)
  validate_integer($num_partitions)
  validate_integer($num_recovery_threads_per_data_dir)
  validate_integer($num_replica_fetchers)
  validate_integer($offset_metadata_max_bytes)
  validate_string($package_name)
  validate_integer($port)
  validate_integer($producer_purgatory_purge_interval_requests)
  validate_integer($queued_max_requests)
  validate_integer($replica_fetch_max_bytes)
  validate_integer($replica_fetch_min_bytes)
  validate_integer($replica_fetch_wait_max_ms)
  validate_integer($replica_high_watermark_checkpoint_interval_ms)
  validate_integer($replica_lag_time_max_ms)
  validate_integer($replica_socket_receive_buffer_bytes)
  validate_integer($replica_socket_timeout_ms)
  validate_boolean($restart_on_change)
  validate_string($service_name)
  validate_integer($socket_receive_buffer_bytes)
  validate_integer($socket_request_max_bytes)
  validate_integer($socket_send_buffer_bytes)
  validate_string($user)
  validate_array($zookeeper_connect)
  validate_integer($zookeeper_connection_timeout_ms)
  validate_integer($zookeeper_session_timeout_ms)
  validate_integer($zookeeper_sync_time_ms)

  class { '::kafka::install': } ->
  class { '::kafka::config': } ->
  class { '::kafka::service': } ->
  Class['::kafka']
}
