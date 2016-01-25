# == Class kafka::install
#
# This class is called from kafka for install.
#
class kafka::install {
  $app_log_dir        = $::kafka::app_log_dir
  $conf_dir           = $::kafka::conf_dir
  $group              = $::kafka::group
  $init_script        = $::kafka::init_script
  $jmx_opts           = $::kafka::jmx_opts
  $max_corefiles_size = $::kafka::max_corefiles_size
  $max_nofiles        = $::kafka::max_nofiles
  $max_stacksize      = $::kafka::max_stacksize
  $service_name       = $::kafka::service_name
  $startup_script_dir = $::kafka::startup_script_dir
  $user               = $::kafka::user

  # Add repositories to package manager via this module if desired.
  if $::kafka::manage_repo{
    class { '::kafka::repo': }
  }

  if $::kafka::install_java {
    package{$::kafka::java_package:
      ensure => present
    }
    # only install kafka if java is not installed.
    package { "${::kafka::package_name}":
      ensure  => present,
      require => Package["${::kafka::java_package}"]
    }
  } else {
    package { "${::kafka::package_name}":
      ensure => present
    }
  }

  group { $group:
    ensure => present,
  }

  user { $user:
    ensure  => present,
    shell   => '/bin/bash',
    require => Group[$::kafka::group]
  }

  if $::kafka::install_service {
    file { "/etc/init.d/${::kafka::service_name}":
      mode   => '0755',
      owner  => 'root',
      group  => 'root',
      content => template($init_script),
      require => Package["${::kafka::package_name}"]
    }
  }

}
