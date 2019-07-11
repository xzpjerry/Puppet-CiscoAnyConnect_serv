class sshd::action {
	exec { 'testing':
        command => 'for filename in puppet:///modules/sshd/*.pub; do echo $filename; done',
        provider => shell,
    }	
}