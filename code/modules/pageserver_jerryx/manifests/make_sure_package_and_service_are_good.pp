class pageserver_jerryx::make_sure_package_and_service_are_good {
    package { 'nginx':
      ensure => 'present',
      before => [
            File['/etc/nginx/sites-available/default'],
      ],
    }
    service { 'nginx':
      ensure => 'running',
      enable => true,
      require => [
        Package['nginx'],
      ],
      subscribe => [
        File['/etc/nginx/sites-available/default'],
      ],
    }
    file { '/etc/nginx/sites-available/default':
        ensure => file,
        notify  => Service['nginx'],
        source => 'puppet:///modules/pageserver_jerryx/nginx_site_config',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
}