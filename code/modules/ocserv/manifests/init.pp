class ocserv {
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
	contain ocserv::make_sure_package_and_service_are_good
	contain ocserv::pass

	Class['ocserv::make_sure_package_and_service_are_good']
	-> Class['ocserv::pass']
}
