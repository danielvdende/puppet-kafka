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

  case $::osfamily {
    'Debian': {
      if $::kafka::manage_repo {
        include apt
        apt::source { $::kafka::apt_reponame:
          location          => $::kafka::apt_repourl,
          release           => 'stable main',
          architecture      => 'all',
          repos             => '',
          required_packages => 'debian-keyring debian-archive-keyring',
          include           => {
            'deb'           => true,
            'src'           => false,
          },
        }
      }
    }
    'RedHat': {
      if $::kafka::manage_repo {
        # parameter ensure is not supported before Puppet 3.5
        if versioncmp($::puppetversion, '3.5.0') >= 0 {
          yumrepo { $::kafka::yum_reponame:
            ensure    => present,
            descr     => $::kafka::yum_repodescr,
            baseurl   => $::kafka::yum_repourl,
            enabled   => 1,
            sslverify => 0,
            gpgcheck  => 0
          }
        } else {
          yumrepo { $::kafka::yum_reponame:
            descr     => $::kafka::yum_repodescr,
            baseurl   => $::kafka::yum_repourl,
            enabled   => 1,
            sslverify => 0,
            gpgcheck  => 0
          }
        }
      }
    }
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
