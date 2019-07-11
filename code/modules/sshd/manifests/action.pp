class sshd::action {
	exec { 'testing':
		cwd => 'puppet:///modules/sshd/',
        command => 'for filename in ./*.pub; do /bin/echo $filename; done',
        provider => shell,
        logoutput => true ,
    }	
}