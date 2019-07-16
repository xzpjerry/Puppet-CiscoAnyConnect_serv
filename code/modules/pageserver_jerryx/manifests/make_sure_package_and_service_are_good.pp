class pageserver_jerryx::make_sure_package_and_service_are_good {
    package { 'nginx':
      ensure => 'present',
    }
    service { 'nginx':
      ensure => 'running',
    }
}