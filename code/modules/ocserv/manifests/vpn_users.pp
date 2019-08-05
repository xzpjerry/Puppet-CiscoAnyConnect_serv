class ocserv::vpn_users {
	group {'vpn-users':
		ensure => present,
		gid => 6007,
	}
    user { 'vpn_test':
    	ensure => present,
    	managehome => false,
    	comment => 'Puppet managed VPN user',
    	password => '$1$Sug4n39p$1pozT4fLM0IPAliorVJZG/',
    	groups => ['vpn-users'],
    }
}