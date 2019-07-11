class sshd::prelude {
    package {'openssh-server':
        ensure      =>present,
        provider    =>apt,
    }
    exec { 'create_authorized_keys_if_not_existing':
        require => Package['openssh-server'],
        creates => '/home/ubuntu/.ssh/authorized_keys',
        command => '/bin/touch /home/ubuntu/.ssh/authorized_keys',
    }
    file { 'check_authorizedkeys_mode':
        require => Package['openssh-server'],
        ensure  => present,
        path    => '/home/ubuntu/.ssh/authorized_keys',
        mode    => "0600",
        owner   => ubuntu,
        group   => ubuntu,
    }
    exec { 'restore_sshdconfig_if_not_existing':
        require => Package['openssh-server'],
        creates => '/etc/ssh/sshd_config',
        command => '/bin/cp /usr/share/openssh/sshd_config /etc/ssh/',
    }
    file { 'check_sshdconfig_mode':
        require => Package['openssh-server'],
        ensure  => present,
        path    => '/etc/ssh/sshd_config',
        mode    => "0644",
        owner   => root,
        group   => root,
    }
}