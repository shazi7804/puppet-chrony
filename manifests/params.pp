class chrony::params {
  # package
  $package_enable        = 'true'
  $package_ensure        = 'present'

  # service
  $service_enable        = true
  $service_ensure        = 'running'
  $service_manage        = true
  $service_name          = 'chrony'

  # config
  $config_template       = 'chrony/chrony.conf.erb'
  $servers               = {
    'tock.stdtime.gov.tw' => ['iburst', 'offline'],
    'watch.stdtime.gov.tw' => ['iburst'],
    'time.stdtime.gov.tw' => ['iburst'],
  }
  $iburst_enable         = true
  $logdir                = '/var/log/chrony'
  $driftfile             = '/var/lib/chrony/chrony.drift'
  $config_keys           = '/etc/chrony.keys'

  case $::osfamily {
    'RedHat': {
      $config = '/etc/chrony.conf'
      $package_name = 'chronyd'

    }
    'Debian': {
      $config = '/etc/chrony/chrony.conf'
      $package_name = 'chrony'

    }
    default: {
      fail("unsupported osfamily: $::osfamily, please contact system admin.")
    }
  }

}