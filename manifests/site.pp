node default {
	include resolvconf
	resources { 'firewall':
     purge => true,
	}
	Firewall {
	 before  => Class['my_fw::post'],
	 require => Class['my_fw::pre'],
	}

	class { ['my_fw::pre', 'my_fw::post']: }
	class { 'firewall': }
	include self_update
	include sshd
	include pageserver
	include user_management
	include ocserv

}
