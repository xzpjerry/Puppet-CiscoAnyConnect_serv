class ocserv::make_sure_package_and_service_are_good {
    package {'ocserv':
        ensure => present,
        provider => apt,
        before => [
        	File['/etc/ocserv/server-cert.pem'],
    		File['/etc/ocserv/server-key.pem'],
    		File['/etc/ocserv/ocserv.conf'],
        ],
    }
    service {'ocserv':
    	ensure => 'running',
    	enable => true,
    	require => [
    		Package['ocserv'],
    	],
    	subscribe => [
    		File['/etc/ocserv/server-cert.pem'],
    		File['/etc/ocserv/server-key.pem'],
    		File['/etc/ocserv/ocserv.conf'],
    	],
    }
    exec { 'reload sysctl':
      command   => 'sysctl -p',
      subscribe => File['/etc/ocserv/ocserv.conf'],
      refreshonly => true,
    }
    file { '/etc/sysctl.conf':
        ensure => file,
        source => 'puppet:///modules/ocserv/sysctl.conf',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
    file { '/etc/ocserv/ocserv.conf':
        ensure => file,
        notify  => Service['ocserv'],
        source => 'puppet:///modules/ocserv/ocserv.conf',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
    file { '/etc/ocserv/server-cert.pem':
        ensure => file,
        notify  => Service['ocserv'],
        source => 'puppet:///modules/ocserv/server-cert.pem',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
    file { '/etc/ocserv/server-key.pem':
        ensure => file,
        notify  => Service['ocserv'],
        source => 'puppet:///modules/ocserv/server-key.pem',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
}