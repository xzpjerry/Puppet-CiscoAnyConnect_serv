class pageserver::html_resources_to_be_imported {
	file { '/var/www/html/':
        ensure => directory,
        mode    => "0755",
        owner   => root,
        group   => root,
        before => [
            File['/var/www/html/index.html'],
            File['/var/www/html/index.css'],
      ],
    }
    file { '/var/www/html/index.html':
        ensure => file,
        source => 'puppet:///modules/pageserver/index.html',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
    file { '/var/www/html/index.css':
        ensure => file,
        source => 'puppet:///modules/pageserver/index.css',
        mode    => "0664",
        owner   => root,
        group   => root,
    }
}