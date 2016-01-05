# == Class kafka::config
#
# This class is called from kafka for service config.
#
class kafka::config {
  $notify_service = $kafka::restart_on_change ? {
    true  => Class['kafka::service'],
    false => undef,
  }

  # validate parameters here
  $tmp_config = {
    'zookeeper.connect' => $::kafka::zk_string,
    'broker.id'         => '1', #$::kafka::brokers[$::fqdn],
    'log.dirs'          => $::kafka::log_dirs
  }

  $kafka_config = merge($::kafka::params::kafka_config_defaults, $::kafka::kafka_config, $tmp_config)

  File {
    owner   => 'kafka',
    group   => 'kafka',
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

  file { [$::kafka::log_dirs, $::kafka::app_log_dir, $::kafka::conf_dir]:
    ensure => directory,
  }

}
