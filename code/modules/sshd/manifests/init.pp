class sshd {
    package {'openssh-server':
        ensure      =>present,
        provider    =>apt,
    }
    
}