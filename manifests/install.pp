# == Class kafka::install
#
# This class is called from kafka for install.
#
class kafka::install {
  case $::osfamily {
    'Debian': {
      if $::kafka::manage_repo {
        include apt
        apt::source { 'confluent':
          location          => 'http://packages.confluent.io/deb/1.0',
          release           => 'stable main',
          architecture      => 'all',
          repos             => '',
          required_packages => 'debian-keyring debian-archive-keyring',
          key               => {
            'id'            => '1A77041E0314E6C5A486524E670540C841468433',
            'source'        => 'http://packages.confluent.io/deb/1.0/archive.key',
          },
          include           => {
            'deb'           => true,
            'src'           => false,
          },
        }
      }
    }
    'RedHat': {
      # parameter ensure is not supported before Puppet 3.5
      if versioncmp($::puppetversion, '3.5.0') >= 0 {
        yumrepo { $::kafka::reponame:
          ensure    => present,
          descr     => $::kafka::repodescr,
          baseurl   => $::kafka::repourl,
          enabled   => 1,
          sslverify => 0,
          gpgcheck  => 0
        }
      } else {
        yumrepo { $::kafka::reponame:
          descr     => $::kafka::repodescr,
          baseurl   => $::kafka::repourl,
          enabled   => 1,
          sslverify => 0,
          gpgcheck  => 0
        }
      }
    }
  }

  if $::kafka::install_java {
    package{$::kafka::java_package:}
    package { "${::kafka::package_name}":
      ensure  => present,
      require => Package[$::kafka::java_package]
    }
  } else {
    package { "${::kafka::package_name}":
      ensure => present,
    }
  }



  group { 'kafka':
    ensure => present,
  }

  user { 'kafka':
    ensure  => present,
    shell   => '/bin/bash',
    require => Group['kafka'],
  }

  if $::kafka::install_service {
    file { "/etc/init.d/${::kafka::service_name}":
      mode   => '0755',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/kafka/kafka.init',
      require => Package["${::kafka::package_name}"]
    }
  }

}
