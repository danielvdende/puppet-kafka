class kafka::repo{
  case $::osfamily {
    'Debian': {
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
    'RedHat': {
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
