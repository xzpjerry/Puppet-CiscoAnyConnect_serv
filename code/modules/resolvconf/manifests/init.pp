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
      command   => '/bin/echo "127.0.0.1 `/bin/cat /etc/hostname`" >> /etc/hosts',
      provider => shell,
      unless => '/bin/grep `/bin/cat /etc/hostname` /etc/hosts',
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
