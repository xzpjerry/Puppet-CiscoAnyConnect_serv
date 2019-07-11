class sshd {
    package {'openssh-server':
        ensure      =>present,
        provider    =>apt,
    }
    exec { 'create_authorized_keys_if_not_existing':
        command => '/bin/touch /home/ubuntu/.ssh/authorized_keys',
        creates => '/home/ubuntu/.ssh/authorized_keys',
    }
    file { 'check_mode':
        ensure  => file,
        path    => '/home/ubuntu/.ssh/authorized_keys',
        mode    => "0600",
        owner   => ubuntu,
        group   => ubuntu,
    }
    
}