class sshd::make_sure_package_and_service_are_good {
    package {'openssh-server':
        ensure => present,
        provider => apt,
        before => [
            File['/etc/ssh/sshd_config'],
        ],
    }
    service { 'sshd':
      ensure => running,
      enable => true,
      require => [
        Package['openssh-server'],
      ],
      subscribe => [
        File['/etc/ssh/sshd_config'],
      ],
    }
    file { '/etc/ssh/sshd_config':
        ensure => file,
        notify  => Service['sshd'],
        source => 'puppet:///modules/sshd/sshd_config',
        mode    => "0600",
        owner   => root,
        group   => root,
    }
}