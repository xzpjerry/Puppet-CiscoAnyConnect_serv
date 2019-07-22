class apache2 {
	package { "apache2":
		ensure => installed;
	}

	file {"/etc/apache2/apache2.conf":
		ensure => present,
		mode => '444',
		owner => 'root',
		group => 'root',
		source => "puppet:///modules/apache2/apache2.conf",
		require => Package["apache2"],
	}

	file {"/var/www/html":
		ensure => directory,
		recurse => true,
		mode => '444',
		owner => 'root',
		group => 'root',
		source => "puppet:///modules/apache2/html",
		require => Package["apache2"],
	}

	service { "apache2":
		enable => true,
		ensure => running,
		subscribe => File["/etc/apache2/apache2.conf"],
		require => [Package["apache2"],],
	}

}
