# == Class kafka::params
#
# This class is meant to be called from kafka.
#
# === Parameters
#
# $app_log_dir::                                    Kafka application logs directory
#                                                   type: absolute directory
#
# $auto_create_topics_enable::                      Enable autocreation of topic
#                                                   type: boolean
#
# $auto_leader_rebalance_enable::                   Enable auto leader rebalancing
#                                                   type: boolean
#
# $background_threads::                             Number of background threads to use
#                                                   type: integer
#
# $broker_id::                                      ID of the Kafka broker. Must be set to a unique integer for
#                                                   each broker
#                                                   type: integer
#
# $conf_dir::                                       Absolute path to the directory where server.properties and
#                                                   log4j.properties are located
#                                                   type: absolute directory
#
# $controlled_shutdown_enable::                     Enable controlled shutdown of server.
#                                                   type: boolean
#
# $controlled_shutdown_max_retries::                Max number of retries to attempt when controlled shutdown fails.
#                                                   type: integer
#
# $controlled_shutdown_retry_backoff_ms::           How long to wait between controlled shutdown retries in ms.
#                                                   type: integer
#
# $controller_message_queue_size::                  Size of the controller message queue
#                                                   type: integer
#
# $controller_socket_timeout_ms::                   Socket timeout in ms for controller-to-broker channels
#                                                   type: integer
#
# $default_replication_factor::                     Default replication factor for automatically created topics
#                                                   (i.e. the default replication unless otherwise specified)
#                                                   type: integer
#
# $delete_topic_enable::                            Enable the deletion of topics.
#                                                   type: boolean
#
# $fetch_purgatory_purge_interval_requests::        The purge interval (in number of requests) of the fetch request
#                                                   purgatory
#                                                   type: integer
#
# $install_java::                                   Enable installation of Java by this module.
#                                                   type: boolean
#
# $install_service::                                Enable installation of Kafka as a service (i.e. should the init
#                                                   script be installed)
#                                                   type: boolean
#
# $java_package::                                   Name of the Java package to install, if $install_java is set to
#                                                   true. This package name must be available for installation through
#                                                   the given package manager.
#                                                   type: string
#
# $jmx_opts::                                       String of JMX options to use.
#                                                   type: string
#
# $jvm_heap_mem::                                   Size of the JVM heap. This setting is used for both -xms(initial
#                                                   heap size) -xmx(maximum heap size). Generally good practice to have
#                                                   both of these the same, as JVM then does not have to increase heap
#                                                   size at runtime.
#                                                   type: integer
#
# $jvm_perf_opts::                                  Any additional JVM performance tweaking options.
#                                                   type: integer
#
# $leader_imbalance_check_interval_seconds::        The frequency with which the partition rebalance check is triggered
#                                                   by the controller in seconds
#                                                   type: integer
#
# $leader_imbalance_per_broker_percentage::         The ratio of leader imbalance allowed per broker.
#                                                   type: numeric
#
# $log_cleaner_backoff_ms::                         Amount of time to sleep when there are no logs to clean in ms
#                                                   type: integer
#
# $log_cleaner_dedupe_buffer_size::                 The total memory used for log deduplication across all cleaner
#                                                   threads in bytes.
#                                                   type: integer
#
# $log_cleaner_delete_retention_ms::                How long delete records are retained in ms.
#                                                   type: integer
#
# $log_cleaner_enable::                             By default the log cleaner is disabled and the log retention policy
#                                                   will default to just delete segments after their retention expires.
#                                                   If true, the cleaner will be enabled and
#                                                   individual logs can then be marked for log compaction.
#                                                   type: boolean
#
# $log_cleaner_io_buffer_load_factor::              Log cleaner dedupe buffer load factor.
#                                                   type: integer
#
# $log_cleaner_io_buffer_size::                     Total memory used for log clean IO buffers across all cleaner
#                                                   threads
#                                                   type: integer
#
# $log_cleaner_min_cleanable_ratio::                Minimum ratio of dirty log to total log for a log to be eligible for
#                                                   cleaning
#                                                   type: numeric
#
# $log_cleaner_threads::                            Number of background threads to use for log cleaning
#                                                   type: integer
#
# $log_cleanup_policy::                             Default cleanup policy for segments for segments beyond the
#                                                   retention window.
#                                                   Possible Values: delete, compact
#                                                   type: string
#
# $log_dirs::                                       The directories in which the log data is kept
#                                                   type: string
#
# $log_flush_interval_messages::                    Number of messages accumulated on a log partition before messages
#                                                   are flushed to disk
#                                                   type: integer
#
# $log_flush_interval_ms::                          Maximum time in ms that a message in any topic is kept in memory
#                                                   before being flushed to disk
#                                                   type: integer
#
# $log_flush_offset_checkpoint_interval_ms::        Frequency in ms with which we update the persistent record of the
#                                                   last flush which acts as the log recovery point
#                                                   type: integer
#
# $log_flush_scheduler_interval_ms::                Frequency in ms that the log flusher checks whether any log needs to
#                                                   be flushed to disk
#                                                   type: integer
#
# $log_index_interval_bytes::                       Interval in bytes with which we add an entry to the offset index
#                                                   type: integer
#
# $log_index_size_max_bytes::                       Maximum size in bytes of the offset index
#                                                   type: integer
#
# $log_retention_bytes::                            A size-based retention policy for logs. Segments are pruned from the
#                                                   log as long as the remaining segments don't drop below
#                                                   log.retention.bytes.
#                                                   type: integer
#
# $log_retention_check_interval_ms::                The interval in ms at which log segments are checked to see if they
#                                                   can be deleted according to the retention policies
#                                                   type: integer
#
# $log_retention_hours::                            The minimum age in hours of a log file to be eligible for deletion
#                                                   type: integer
#
# $log_retention_minutes::                          Number of minutes to keep a log file before deleting it. If not set,
#                                                   the value of $log_retention_hours is used.
#                                                   type: integer
#
# $log_roll_hours::                                 Maximum time before a new log segment is rolled out in hours
#                                                   type: integer
#
# $log_segment_bytes::                              The maximum size of a log segment file. When this size is reached a
#                                                   new log segment will be created.
#                                                   type: integer
#
# $log4j_opts::                                     Any additional log4j environment configuration you wish to override
#                                                   type: string
#
# $manage_repo::                                    Enable installation of Kafka via package manager repository.
#                                                   type: boolean
#
# $manage_service::                                 Enable to enforce the service to be running or not.
#                                                   type: boolean
#
# $max_nofiles::                                    The maximum number of files allowed to be open.
#                                                   type: integer
#
# $message_max_bytes::                              The maximum size in bytes of a message that a server can receive
#                                                   type: integer
#
# $num_io_threads::                                 The number of threads permitted to be doing disk I/O
#                                                   type: integer
#
# $num_network_threads::                            The number of threads handling network requests.
#                                                   type: integer
#
# $num_partitions::                                 The default number of log partitions per topic. More partitions
#                                                   allow greater parallelism for consumption, but this will also result
#                                                   in more files across the brokers.
#                                                   type: integer
#
# $num_recovery_threads_per_data_dir::              The number of threads per data directory to be used for log recovery
#                                                   at startup and flushing at shutdown. This value is recommended to be
#                                                   increased for installations with data dirs located in RAID array.
#                                                   type: integer
#
# $num_replica_fetchers::                           Number of fetcher threads used to replicate messages from a source
#                                                   broker.
#                                                   type: integer
#
# $offset_metadata_max_bytes::                      The maximum size for a metadata entry associated with an offset
#                                                   commit
#                                                   type: integer
#
# $package_name::                                   Name of the package to use.
#                                                   type: string
#
# $port::                                           Port for the Kafka broker to listen on
#                                                   type: integer
#
# $producer_purgatory_purge_interval_requests::     The purge interval (in number of requests) of the producer request
#                                                   purgatory
#                                                   type: integer
#
# $queued_max_requests::                            The number of queued requests allowed before blocking the network
#                                                   threads
#                                                   type: integer
#
# $replica_fetch_max_bytes::                        Number of bytes of messages to attempt to fetch
#                                                   type: integer
#
# $replica_fetch_min_bytes::                        Minimum number of expected for each fetch response
#                                                   type: integer
#
# $replica_fetch_wait_max_ms::                      Max wait time for each fetcher request issued by follower replicas
#                                                   type: integer
#
# $replica_high_watermark_checkpoint_interval_ms::  The frequency in ms with which the high watermark is saved out to
#                                                   disk
#                                                   type: integer
#
# $replica_lag_time_max_ms::                        If a follower hasn't sent any fetch requests or hasn't consumed up
#                                                   to the leaders log end offset for at least this time in ms, the
#                                                   leader will remove the follower from isr
#                                                   type: integer
#
# $replica_socket_receive_buffer_bytes::            The socket receive buffer for network requests
#                                                   type: integer
#
# $replica_socket_timeout_ms::                      Socket timeout in ms for network requests
#                                                   type: integer
#
# $repodescr::                                      Description of the repository to use for installing Kafka.
#                                                   type: string
#
# $reponame::                                       Name of the respository to use for installing Kafka.
#                                                   type: string
#
# $repourl::                                        URL where the repository to use for installing Kafka can be found.
#                                                   type: string
#
# $restart_on_change::                              Restart the Kafka service if any of the configuration files change.
#                                                   type: boolean
#
# $service_name::                                   Name of the service to run and under which to install Kafka.
#                                                   type: string
#
# $socket_receive_buffer_bytes::                    The receive buffer (SO_RCVBUF) used by the socket server
#                                                   type: integer
#
# $socket_request_max_bytes::                       The maximum size of a request that the socket server will accept
#                                                   (protection against OOM)
#                                                   type: integer
#
# $socket_send_buffer_bytes::                       The send buffer (SO_SNDBUF) used by the socket server
#                                                   type: integer
#
# $zookeeper_connect::                              List of zookeeper nodes to use. Should be in the form hostname:port
#                                                   type: array
#
# $zookeeper_connection_timeout_ms::                Timeout in ms for connecting to zookeeper
#                                                   type: integer
#
# $zookeeper_session_timeout_ms::                   Zookeeper session timeout in ms
#                                                   type: integer
#
# $zookeeper_sync_time_ms::                         How far a Zookeeper follower can be behind the Zookeeper leader
#                                                   type: integer
class kafka::params {
  $app_log_dir                                    = '/var/log/kafka'
  $auto_create_topics_enable                      = true
  $auto_leader_rebalance_enable                   = true
  $background_threads                             = '4'
  $broker_id                                      = '1'
  $conf_dir                                       = '/etc/kafka'
  $controlled_shutdown_enable                     = true
  $controlled_shutdown_max_retries                = '3'
  $controlled_shutdown_retry_backoff_ms           = '5000'
  $controller_message_queue_size                  = '10'
  $controller_socket_timeout_ms                   = '30000'
  $default_replication_factor                     = '1'
  $delete_topic_enable                            = false
  $fetch_purgatory_purge_interval_requests        = '10000'
  $group                                          = 'kafka'
  $install_java                                   = true
  $install_service                                = true
  $java_package                                   = 'java-1.8.0-openjdk'
  $jmx_opts                                       = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.net.preferIPv4Stack=true -Dcom.sun.management.jmxremote.port=9999'
  $jvm_heap_mem                                   = '-Xmx1G -Xms1G'
  $jvm_perf_opts                                  = '-XX:PermSize=48m -XX:MaxPermSize=48m -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35'
  $leader_imbalance_check_interval_seconds        = '300'
  $leader_imbalance_per_broker_percentage         = '10'
  $log_cleaner_backoff_ms                         = '15000'
  $log_cleaner_dedupe_buffer_size                 = '524288000'
  $log_cleaner_delete_retention_ms                = '86400000'
  $log_cleaner_enable                             = false
  $log_cleaner_io_buffer_load_factor              = '0.9'
  $log_cleaner_io_buffer_size                     = '524288'
  $log_cleaner_min_cleanable_ratio                = '0.5'
  $log_cleaner_threads                            = '1'
  $log_cleanup_policy                             = 'delete'
  $log_dirs                                       = '/tmp/kafka-logs'
  $log_flush_interval_messages                    = '10000'
  $log_flush_interval_ms                          = '3000'
  $log_flush_offset_checkpoint_interval_ms        = '60000'
  $log_flush_scheduler_interval_ms                = '3000'
  $log_index_interval_bytes                       = '4096'
  $log_index_size_max_bytes                       = '10485760'
  $log_retention_bytes                            = '-1'
  $log_retention_check_interval_ms                = '300000'
  $log_retention_hours                            = '168'
  $log_retention_minutes                          = '10080'
  $log_roll_hours                                 = '168'
  $log_segment_bytes                              = '1073741824'
  $log4j_opts                                     = "-Dlog4j.configuration=file:${conf_dir}/log4j.properties"
  $manage_repo                                    = true
  $manage_service                                 = true
  $max_nofiles                                    = '65535'
  $message_max_bytes                              = '1000000'
  $num_io_threads                                 = '8'
  $num_network_threads                            = '3'
  $num_partitions                                 = '1'
  $num_recovery_threads_per_data_dir              = '1'
  $num_replica_fetchers                           = '1'
  $offset_metadata_max_bytes                      = '1024'
  $package_name                                   = 'kafka'
  $port                                           = '9092'
  $producer_purgatory_purge_interval_requests     = '10000'
  $queued_max_requests                            = '500'
  $replica_fetch_max_bytes                        = '10241024'
  $replica_fetch_min_bytes                        = '1'
  $replica_fetch_wait_max_ms                      = '500'
  $replica_high_watermark_checkpoint_interval_ms  = '5000'
  $replica_lag_time_max_ms                        = '10000'
  $replica_socket_receive_buffer_bytes            = '641024'
  $replica_socket_timeout_ms                      = '301000'
  $repodescr                                      = ''
  $reponame                                       = ''
  $repourl                                        = ''
  $restart_on_change                              = true
  $service_name                                   = 'kafka'
  $socket_receive_buffer_bytes                    = '102400'
  $socket_request_max_bytes                       = '104857600'
  $socket_send_buffer_bytes                       = '102400'
  $user                                           = 'kafka'
  $zookeeper_connect                              = []
  $zookeeper_connection_timeout_ms                = '6000'
  $zookeeper_session_timeout_ms                   = '6000'
  $zookeeper_sync_time_ms                         = '2000'
}
