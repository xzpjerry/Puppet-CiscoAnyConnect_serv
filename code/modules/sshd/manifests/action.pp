class sshd::action {
	exec { 'testing':
        command => 'for filename in puppet:///modules/sshd/*.pub; do /bin/echo $filename; done',
        provider => shell,
        logoutput => true ,
    }	
}