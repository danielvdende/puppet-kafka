# == Class kafka::install
#
# This class is called from kafka for install.
#
class kafka::install {
  $conf_dir     = $::kafka::conf_dir
  $jmx_opts     = $::kafka::jmx_opts
  $user         = $::kafka::user
  $group        = $::kafka::group
  $service_name = $::kafka::service_name

  # Add repositories to package manager via this module if desired.
  if $::kafka::manage_repo{
    class { '::kafka::repo': }
  }

  if $::kafka::install_java {
    package{$::kafka::java_package:}
    # only install kafka if java is not installed.
    package { "${::kafka::package_name}":
      ensure  => present,
      require => Package[$::kafka::java_package]
    }
  } else {
    package { "${::kafka::package_name}":
      ensure => present
    }
  }

  group { $::kafka::group:
    ensure => present,
  }

  user { $::kafka::user:
    ensure  => present,
    shell   => '/bin/bash',
    require => Group[$::kafka::group]
  }

  if $::kafka::install_service {
    file { "/etc/init.d/${::kafka::service_name}":
      mode   => '0755',
      owner  => 'root',
      group  => 'root',
      content => template('kafka/kafka.init.erb'),
      require => Package["${::kafka::package_name}"]
    }
  }

}
