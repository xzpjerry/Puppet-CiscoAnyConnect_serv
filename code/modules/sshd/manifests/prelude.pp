class sshd::prelude {
    package {'openssh-server':
        ensure => present,
        provider => apt,
        before => [
            File['/etc/ssh/sshd_config'],
            File['/home/ubuntu/.ssh/authorized_keys'],
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
        File['/home/ubuntu/.ssh/authorized_keys'],
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
    file { '/home/ubuntu/.ssh/authorized_keys':
        ensure  => file,
        notify  => Service['sshd'],
        source  => 'puppet:///modules/sshd/authorized_keys',
        mode    => "0600",
        owner   => ubuntu,
        group   => ubuntu,
    }
}