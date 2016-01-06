# == Class: kafka
#
# Used to setup, install and intialize a Kafka broker
#
# === Parameters
#
# [*package_name*]
#   Base name of the package, we append *scala_version*  to get full name
#
# [*service_name*]
#   Name of the service to install and use
#
# [*brokers*]
#   Hash map hostname to broker id
#
# [*scala_version*]
#   Scala you are using, used to install correct package
#
# [*version*]
#   Version of Kafka to install
#
# [*install_java*]
#   Whether or not we should install java
#
# [*install_service*]
#   Install init script
#
# [*restart_on_change*]
#   Bounce service on confiuration changes
#
# [*manage_service*]
#   Setup init service
#
# [*manage_repo*]
#   Install Confluent Deb repo
#
# [*kafka_config*]
#   Hash map to set any kafka server.properties settings
#
# [*zk_hosts*]
#   List of Zookeeper servers with port numbers
#
# [*zk_chroot*]
#   If you are using a chroot in zookeeper
#
# [*log_dirs*]
#   List where data is stored
#
# [*app_log_dir*]
#   Setup where kafka application logs should goto
#
# [*jvm_heap_mem*]
#   Used for setting -Xmx and -Xms
#
# [*jvm_perf_opts*]
#   Any additional JVM options you want to set
#
# [*jmx_opts*]
#   Setup and configure JMX
#
# [*log4j_opts*]
#   Override Log4J file
#

# $package_name      = $::kafka::params::package_name,
# $service_name      = $::kafka::params::service_name,
# $brokers           = $::kafka::params::brokers,
# $scala_version     = $::kafka::params::scala_version,
# $version           = $::kafka::params::version,
# $install_java      = $::kafka::params::install_java,
# $install_service   = $::kafka::params::install_service,
# $restart_on_change = $::kafka::params::restart_on_change,
# $manage_service    = $::kafka::params::manage_service,
# $manage_repo       = $::kafka::params::manage_repo,
# $kafka_config      = $::kafka::params::kafka_config_defaults,
# $zk_hosts          = $::kafka::params::zk_hosts,
# $log_dirs          = $::kafka::params::log_dirs,
# $app_log_dir       = $::kafka::params::app_log_dir,
# $jvm_heap_mem      = $::kafka::params::jvm_heap_mem,
# $jvm_perf_opts     = $::kafka::params::jvm_perf_opts,
# $jmx_opts          = $::kafka::params::jmx_opts,
# $log4j_opts        = $::kafka::params::log4j_opts,

class kafka (
  $scala_version                                  = $::kafka::params::scala_version,
  $service_name                                   = $::kafka::params::service_name,
  $package_name                                   = $::kafka::params::package_name,
  $version                                        = $::kafka::params::version,
  $install_java                                   = $::kafka::params::install_java,
  $java_package                                   = $::kafka::params::java_package,
  $install_service                                = $::kafka::params::install_service,
  $restart_on_change                              = $::kafka::params::restart_on_change,
  $manage_service                                 = $::kafka::params::manage_service,
  $manage_repo                                    = $::kafka::params::manage_repo,
  $reponame                                       = $::kafka::params::reponame,
  $repourl                                        = $::kafka::params::repourl,
  $repodescr                                      = $::kafka::params::repodescr,
  $zookeeper_connect                              = $::kafka::params::zookeeper_connect,
  $max_nofiles                                    = $::kafka::params::max_nofiles,
  $log_dirs                                       = $::kafka::params::log_dirs,
  $app_log_dir                                    = $::kafka::params::app_log_dir,
  $conf_dir                                       = $::kafka::params::conf_dir,
  $jvm_heap_mem                                   = $::kafka::params::jvm_heap_mem,
  $jvm_perf_opts                                  = $::kafka::params::jvm_perf_opts,
  $jmx_opts                                       = $::kafka::params::jmx_opts,
  $log4j_opts                                     = $::kafka::params::log4j_opts,
  $broker_id                                      = $::kafka::params::broker_id,
  $port                                           = $::kafka::params::port,
  $message_max_bytes                              = $::kafka::params::message_max_bytes,
  $num_network_threads                            = $::kafka::params::num_network_threads,
  $num_io_threads                                 = $::kafka::params::num_io_threads,
  $background_threads                             = $::kafka::params::background_threads,
  $queued_max_requests                            = $::kafka::params::queued_max_requests,
  $socket_send_buffer_bytes                       = $::kafka::params::socket_send_buffer_bytes,
  $socket_receive_buffer_bytes                    = $::kafka::params::socket_receive_buffer_bytes,
  $socket_request_max_bytes                       = $::kafka::params::socket_request_max_bytes,
  $num_partitions                                 = $::kafka::params::num_partitions,
  $log_segment_bytes                              = $::kafka::params::log_segment_bytes,
  $log_roll_hours                                 = $::kafka::params::log_roll_hours,
  $log_cleanup_policy                             = $::kafka::params::log_cleanup_policy,
  $log_retention_hours                            = $::kafka::params::log_retention_hours,
  $log_retention_minutes                          = $::kafka::params::log_retention_minutes,
  $log_retention_bytes                            = $::kafka::params::log_retention_bytes,
  $log_retention_check_interval_ms                = $::kafka::params::log_retention_check_interval_ms,
  $log_cleaner_enable                             = $::kafka::params::log_cleaner_enable,
  $log_cleaner_threads                            = $::kafka::params::log_cleaner_threads,
  $log_cleaner_dedupe_buffer_size                 = $::kafka::params::log_cleaner_dedupe_buffer_size,
  $log_cleaner_io_buffer_size                     = $::kafka::params::log_cleaner_io_buffer_size,
  $log_cleaner_io_buffer_load_factor              = $::kafka::params::log_cleaner_io_buffer_load_factor,
  $log_cleaner_backoff_ms                         = $::kafka::params::log_cleaner_backoff_ms,
  $log_cleaner_min_cleanable_ratio                = $::kafka::params::log_cleaner_min_cleanable_ratio,
  $log_cleaner_delete_retention_ms                = $::kafka::params::log_cleaner_delete_retention_ms,
  $log_index_size_max_bytes                       = $::kafka::params::log_index_size_max_bytes,
  $log_index_interval_bytes                       = $::kafka::params::log_index_interval_bytes,
  $log_flush_interval_messages                    = $::kafka::params::log_flush_interval_messages,
  $log_flush_scheduler_interval_ms                = $::kafka::params::log_flush_scheduler_interval_ms,
  $log_flush_interval_ms                          = $::kafka::params::log_flush_interval_ms,
  $log_flush_offset_checkpoint_interval_ms        = $::kafka::params::log_flush_offset_checkpoint_interval_ms,
  $auto_create_topics_enable                      = $::kafka::params::auto_create_topics_enable,
  $controller_socket_timeout_ms                   = $::kafka::params::controller_socket_timeout_ms,
  $controller_message_queue_size                  = $::kafka::params::controller_message_queue_size,
  $default_replication_factor                     = $::kafka::params::default_replication_factor,
  $replica_lag_time_max_ms                        = $::kafka::params::replica_lag_time_max_ms,
  $replica_socket_timeout_ms                      = $::kafka::params::replica_socket_timeout_ms,
  $replica_socket_receive_buffer_bytes            = $::kafka::params::replica_socket_receive_buffer_bytes,
  $replica_fetch_max_bytes                        = $::kafka::params::replica_fetch_max_bytes,
  $replica_fetch_wait_max_ms                      = $::kafka::params::replica_fetch_wait_max_ms,
  $replica_fetch_min_bytes                        = $::kafka::params::replica_fetch_min_bytes,
  $num_replica_fetchers                           = $::kafka::params::num_replica_fetchers,
  $replica_high_watermark_checkpoint_interval_ms  = $::kafka::params::replica_high_watermark_checkpoint_interval_ms,
  $fetch_purgatory_purge_interval_requests        = $::kafka::params::fetch_purgatory_purge_interval_requests,
  $producer_purgatory_purge_interval_requests     = $::kafka::params::producer_purgatory_purge_interval_requests,
  $zookeeper_session_timeout_ms                   = $::kafka::params::zookeeper_session_timeout_ms,
  $zookeeper_connection_timeout_ms                = $::kafka::params::zookeeper_connection_timeout_ms,
  $zookeeper_sync_time_ms                         = $::kafka::params::zookeeper_sync_time_ms,
  $controlled_shutdown_enable                     = $::kafka::params::controlled_shutdown_enable,
  $controlled_shutdown_max_retries                = $::kafka::params::controlled_shutdown_max_retries,
  $controlled_shutdown_retry_backoff_ms           = $::kafka::params::controlled_shutdown_retry_backoff_ms,
  $auto_leader_rebalance_enable                   = $::kafka::params::auto_leader_rebalance_enable,
  $leader_imbalance_per_broker_percentage         = $::kafka::params::leader_imbalance_per_broker_percentage,
  $leader_imbalance_check_interval_seconds        = $::kafka::params::leader_imbalance_check_interval_seconds,
  $offset_metadata_max_bytes                      = $::kafka::params::offset_metadata_max_bytes,
  $delete_topic_enable                            = $::kafka::params::delete_topic_enable,
  $num_recovery_threads_per_data_dir              = $::kafka::params::num_recovery_threads_per_data_dir
) inherits ::kafka::params {

  class { '::kafka::install': } ->
  class { '::kafka::config': } ->
  class { '::kafka::service': } ->
  Class['::kafka']
}
