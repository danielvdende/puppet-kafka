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

class kafka (
  $package_name      = $::kafka::params::package_name,
  $service_name      = $::kafka::params::service_name,
  $brokers           = $::kafka::params::brokers,
  $scala_version     = $::kafka::params::scala_version,
  $version           = $::kafka::params::version,
  $install_java      = $::kafka::params::install_java,
  $install_service   = $::kafka::params::install_service,
  $restart_on_change = $::kafka::params::restart_on_change,
  $manage_service    = $::kafka::params::manage_service,
  $manage_repo       = $::kafka::params::manage_repo,
  $kafka_config      = $::kafka::params::kafka_config_defaults,
  $zk_hosts          = $::kafka::params::zk_hosts,
  $log_dirs          = $::kafka::params::log_dirs,
  $app_log_dir       = $::kafka::params::app_log_dir,
  $jvm_heap_mem      = $::kafka::params::jvm_heap_mem,
  $jvm_perf_opts     = $::kafka::params::jvm_perf_opts,
  $jmx_opts          = $::kafka::params::jmx_opts,
  $log4j_opts        = $::kafka::params::log4j_opts,

) inherits ::kafka::params {

  # Verification
  
  validate_array($zk_hosts)
  validate_hash($brokers)
  validate_hash($kafka_config)

  $zk_string = join($::kafka::zk_hosts, ',')

  class { '::kafka::install': } ->
  class { '::kafka::config': } ->
  class { '::kafka::service': } ->
  Class['::kafka']
}
