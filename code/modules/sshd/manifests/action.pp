class sshd::action {
	exec { 'testing':
		cwd => '/tmp/pub_keys',
        command => 'for filename in ./*.pub; do /usr/bin/ssh-import-id ./$filename; done',
        provider => shell,
        logoutput => true ,
    }	
}