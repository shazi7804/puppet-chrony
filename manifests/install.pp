class chrony::install inherits chrony {

  if ! ($package_ensure in [ 'absent', 'held', 'installed', 'latest', 'present', 'purged' ]) {
    fail('$package_ensure package_ensure parameter must be one of absent, held, installed, latest, present, purged')
  }

  package { 'chrony':
    ensure => $package_ensure,
    name   => $package_name,
  }
}