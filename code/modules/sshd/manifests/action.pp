class sshd::action {
	exec { 'testing':
		cwd => '/tmp/pub_keys',
        command => 'for filename in ./*.pub; do /bin/echo $filename; done',
        provider => shell,
        logoutput => true ,
    }	
}