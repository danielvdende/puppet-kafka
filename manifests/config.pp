# == Class kafka::config
#
# This class is called from kafka for service config.
#
class kafka::config {
  $auto_create_topics_enable                      = $::kafka::auto_create_topics_enable
  $auto_leader_rebalance_enable                   = $::kafka::auto_leader_rebalance_enable
  $background_threads                             = $::kafka::background_threads
  $broker_id                                      = $::kafka::broker_id
  $controlled_shutdown_enable                     = $::kafka::controlled_shutdown_enable
  $controlled_shutdown_max_retries                = $::kafka::controlled_shutdown_max_retries
  $controlled_shutdown_retry_backoff_ms           = $::kafka::controlled_shutdown_retry_backoff_ms
  $controller_message_queue_size                  = $::kafka::controller_message_queue_size
  $controller_socket_timeout_ms                   = $::kafka::controller_socket_timeout_ms
  $default_replication_factor                     = $::kafka::default_replication_factor
  $delete_topic_enable                            = $::kafka::delete_topic_enable
  $fetch_purgatory_purge_interval_requests        = $::kafka::fetch_purgatory_purge_interval_requests
  $group                                          = $::kafka::group
  $leader_imbalance_check_interval_seconds        = $::kafka::leader_imbalance_check_interval_seconds
  $leader_imbalance_per_broker_percentage         = $::kafka::leader_imbalance_per_broker_percentage
  $log_cleaner_backoff_ms                         = $::kafka::log_cleaner_backoff_ms
  $log_cleaner_dedupe_buffer_size                 = $::kafka::log_cleaner_dedupe_buffer_size
  $log_cleaner_delete_retention_ms                = $::kafka::log_cleaner_delete_retention_ms
  $log_cleaner_enable                             = $::kafka::log_cleaner_enable
  $log_cleaner_io_buffer_load_factor              = $::kafka::log_cleaner_io_buffer_load_factor
  $log_cleaner_io_buffer_size                     = $::kafka::log_cleaner_io_buffer_size
  $log_cleaner_min_cleanable_ratio                = $::kafka::log_cleaner_min_cleanable_ratio
  $log_cleaner_threads                            = $::kafka::log_cleaner_threads
  $log_cleanup_policy                             = $::kafka::log_cleanup_policy
  $log_dirs                                       = $::kafka::log_dirs
  $log_flush_interval_messages                    = $::kafka::log_flush_interval_messages
  $log_flush_interval_ms                          = $::kafka::log_flush_interval_ms
  $log_flush_offset_checkpoint_interval_ms        = $::kafka::log_flush_offset_checkpoint_interval_ms
  $log_flush_scheduler_interval_ms                = $::kafka::log_flush_scheduler_interval_ms
  $log_index_interval_bytes                       = $::kafka::log_index_interval_bytes
  $log_index_size_max_bytes                       = $::kafka::log_index_size_max_bytes
  $log_retention_bytes                            = $::kafka::log_retention_bytes
  $log_retention_check_interval_ms                = $::kafka::log_retention_check_interval_ms
  $log_retention_hours                            = $::kafka::log_retention_hours
  $log_retention_minutes                          = $::kafka::log_retention_minutes
  $log_roll_hours                                 = $::kafka::log_roll_hours
  $log_segment_bytes                              = $::kafka::log_segment_bytes
  $message_max_bytes                              = $::kafka::message_max_bytes
  $num_io_threads                                 = $::kafka::num_io_threads
  $num_network_threads                            = $::kafka::num_network_threads
  $num_partitions                                 = $::kafka::num_partitions
  $num_recovery_threads_per_data_dir              = $::kafka::num_recovery_threads_per_data_dir
  $num_replica_fetchers                           = $::kafka::num_replica_fetchers
  $offset_metadata_max_bytes                      = $::kafka::offset_metadata_max_bytes
  $port                                           = $::kafka::port
  $producer_purgatory_purge_interval_requests     = $::kafka::producer_purgatory_purge_interval_requests
  $queued_max_requests                            = $::kafka::queued_max_requests
  $replica_fetch_max_bytes                        = $::kafka::replica_fetch_max_bytes
  $replica_fetch_min_bytes                        = $::kafka::replica_fetch_min_bytes
  $replica_fetch_wait_max_ms                      = $::kafka::replica_fetch_wait_max_ms
  $replica_high_watermark_checkpoint_interval_ms  = $::kafka::replica_high_watermark_checkpoint_interval_ms
  $replica_lag_time_max_ms                        = $::kafka::replica_lag_time_max_ms
  $replica_socket_receive_buffer_bytes            = $::kafka::replica_socket_receive_buffer_bytes
  $replica_socket_timeout_ms                      = $::kafka::replica_socket_timeout_ms
  $restart_on_change                              = $::kafka::restart_on_change
  $socket_receive_buffer_bytes                    = $::kafka::socket_receive_buffer_bytes
  $socket_request_max_bytes                       = $::kafka::socket_request_max_bytes
  $socket_send_buffer_bytes                       = $::kafka::socket_send_buffer_bytes
  $user                                           = $::kafka::user
  $zookeeper_connect                              = $::kafka::zookeeper_connect
  $zookeeper_connection_timeout_ms                = $::kafka::zookeeper_connection_timeout_ms
  $zookeeper_session_timeout_ms                   = $::kafka::zookeeper_session_timeout_ms
  $zookeeper_sync_time_ms                         = $::kafka::zookeeper_sync_time_ms

  $notify_service = $restart_on_change ? {
    true  => Class['kafka::service'],
    false => undef
  }

  # specify the kafka user for all files/dirs to be created
  File {
    owner   => $::kafka::user,
    group   => $::kafka::group,
    mode    => '0644',
    notify  => $notify_service,
  }

  file { '/etc/default/kafka':
    content => template('kafka/kafka.defaults.erb'),
  }

  file { "${::kafka::conf_dir}/server.properties":
    content => template('kafka/server.properties.erb'),
    require => File[$::kafka::conf_dir]
  }

  file { "${::kafka::conf_dir}/log4j.properties":
    content => template('kafka/log4j.properties.erb'),
    require => File[$::kafka::conf_dir]
  }

  # create directories needed
  file { [$::kafka::log_dirs, $::kafka::app_log_dir, $::kafka::conf_dir]:
    ensure => directory,
  }

}
