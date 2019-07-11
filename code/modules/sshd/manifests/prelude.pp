class sshd::prelude {
    package {'openssh-server':
        ensure      =>present,
        provider    =>apt,
    }
    service { 'sshd':
      ensure    => running,
      require => [
        Package['openssh-server'],
        File['/etc/ssh/sshd_config'],
      ]
    }
    exec { 'restore_sshdconfig_if_not_existing':
        require => Package['openssh-server'],
        creates => '/etc/ssh/sshd_config',
        command => '/bin/cp /usr/share/openssh/sshd_config /etc/ssh/',
    }
    file { '/etc/ssh/sshd_config':
        require => Exec['restore_sshdconfig_if_not_existing'],
        ensure  => present,
        mode    => "0644",
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