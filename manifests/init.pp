class chrony (
  $package_name         = $chrony::params::package_name,
  $package_ensure       = $chrony::params::package_ensure,
  $service_manage       = $chrony::params::service_manage,
  $service_enable       = $chrony::params::service_enable,
  $service_ensure       = $chrony::params::service_ensure,
  $service_name         = $chrony::params::service_name,
  $config               = $chrony::params::config,
  $config_template      = $chrony::params::config_template,
  $servers              = $chrony::params::servers,
  $iburst_enable        = $chrony::params::iburst_enable,
  $config_keys          = $chrony::params::config_keys,
) inherits chrony::params {

  include '::chrony::install'
  include '::chrony::config'
  include '::chrony::service'

  anchor { 'chrony::begin': }
  anchor { 'chrony::end': }

  Anchor['chrony::begin'] ->
  Class['::chrony::install'] ->
  Class['::chrony::config'] ->
  Class['chrony::service'] -> 
  Anchor['chrony::end']
}