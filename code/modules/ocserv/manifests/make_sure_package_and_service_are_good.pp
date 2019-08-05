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
    }
}