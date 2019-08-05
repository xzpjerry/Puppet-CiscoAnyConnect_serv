class ocserv::make_sure_package_and_service_are_good {
    firewall { '100 allow openconnect 443 tcp':
        chain => 'INPUT',
        state => ['NEW'],
        dport => '443',
        proto => 'tcp',
        action => 'accept',
    }
    firewall { '100 allow openconnect 443 udp':
        chain => 'INPUT',
        state => ['NEW'],
        dport => '443',
        proto => 'udp',
        action => 'accept',
    }
    firewall { '100 allow nat':
        table => 'nat',
        chain => 'POSTROUTING',
        jump => 'MASQUERADE'
    }
    package {'ocserv':
        ensure => present,
        provider => apt,
        before => [
            File['/etc/ssh/sshd_config'],
        ],
    }
    package {'ocserv':
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