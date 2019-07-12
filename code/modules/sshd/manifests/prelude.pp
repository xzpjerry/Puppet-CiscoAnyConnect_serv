class sshd::prelude {
    package {'openssh-server':
        ensure => present,
        provider => apt,
        before => File['/etc/ssh/sshd_config']
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
    exec { 'create_authorized_keys_if_not_existing':
        require => Service['sshd'],
        creates => '/home/ubuntu/.ssh/authorized_keys',
        command => '/bin/touch /home/ubuntu/.ssh/authorized_keys',
    }
    file { '/home/ubuntu/.ssh/authorized_keys':
        require => Service['sshd'],
        ensure  => present,
        mode    => "0600",
        owner   => ubuntu,
        group   => ubuntu,
    }
}