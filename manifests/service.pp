# == Class kafka::service
#
# This class is meant to be called from kafka.
# It ensures the service is running.
#
class kafka::service {
  $manage_service_ensure = $::kafka::manage_service ? {
    true    => 'running',
    false   => undef,
    default => undef,
  }

  service { $::kafka::service_name:
    ensure     => $manage_service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
