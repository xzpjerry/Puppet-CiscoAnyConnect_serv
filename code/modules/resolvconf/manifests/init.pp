class resolvconf {
	package {'resolvconf':
        ensure => present,
        provider => apt,
        before => [
            File['/etc/resolvconf/resolv.conf.d/tail'],
            Service['resolvconf'],
        ],
    }
    exec { 'append hostname to hosts':
      path => "/etc/",
      command   => '/bin/echo "127.0.0.1 $HOSTNAME" >> hosts',
      provider => shell,
      onlyif => '/bin/grep -c $HOSTNAME /etc/hosts',
    }
    service {'resolvconf':
        ensure => 'running',
        enable => true,
        require => [
            Package['resolvconf'],
        ],
        subscribe => [
            File['/etc/resolvconf/resolv.conf.d/tail'],
        ],
    }
    file { '/etc/resolvconf/resolv.conf.d/tail':
        ensure => file,
        source => 'puppet:///modules/resolvconf/tail',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
}
