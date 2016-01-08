class kafka::repo{
  case $::osfamily {
    'Debian': {
      include apt
      apt::source { 'kafka':
        location          => 'http://packages.confluent.io/deb/2.0',
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
    'RedHat': {
      # parameter ensure is not supported before Puppet 3.5
      if versioncmp($::puppetversion, '3.5.0') >= 0 {
        yumrepo { 'kafka':
          ensure    => present,
          descr     => 'Confluent repository for 2.0.x packages',
          baseurl   => "http://packages.confluent.io/rpm/2.0",
          enabled   => 1,
          sslverify => 0,
          gpgcheck  => 0
        }
      } else {
        yumrepo { 'kafka':
          descr     => 'Confluent repository for 2.0.x packages',
          baseurl   => "http://packages.confluent.io/rpm/2.0",
          enabled   => 1,
          sslverify => 0,
          gpgcheck  => 0
        }
      }
    }
  }
}
