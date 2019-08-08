class ocserv::vpn_users {
	group {'vpn-users':
		ensure => present,
		gid => 6007,
	}
    user { 'zhipengx_vpn':
    	ensure => absent,
    	managehome => false,
    	comment => 'Puppet managed VPN user',
    	password => '$1$Jf3m.KJs$EDMExKARj/0I55c0uwtUP1',
    	groups => ['vpn-users'],
    }
    user { 'stevev_vpn':
        ensure => present,
        managehome => false,
        comment => 'Puppet managed VPN user',
        password => '$1$b2X2kmkL$PT33u8Pa2aB5FWq3ftGUJ0',
        groups => ['vpn-users'],
    }
}