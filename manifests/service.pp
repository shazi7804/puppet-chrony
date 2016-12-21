class chrony::service inherits chrony {

  if !($service_ensure in ['running', 'stopped']) {
    fail('$service_ensure service_ensure parameter must be one of running, stopped')
  }

  if $service_manage == true {
    service { 'chrony':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}