class sshd {
	package { "openssh-server":
		ensure => installed
	}

	file { "/etc/ssh/sshd_config":
		ensure => present,
		mode => '444',
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/sshd/sshd_config',
		require => Package["openssh-server"],
	}

	service { "ssh":
		enable => true,
		ensure => running,
		subscribe => File["/etc/ssh/sshd_config"],
	}

	ssh_authorized_key { "mapu_pub_key":
		ensure => present,
		user => "ubuntu",
		type => "ssh-rsa",
		key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDHfT9V5ERJ9sGiPwqijec52HiaEKxKoPuW2ehz8Te2g/cBAHWi8jQz8X+KvEb/Nqmv0Q29N1WkUWzGAjjRQP9Cyhe5NN2DVTD5FjX9W8YFoMxHBIBAvK68I1PTSYrkh7A6UtfsRx0bxg/uEfjRzstU+D0mg7T+x6ysuMjs6+HVXVNAj+Qr0NAkaMnMoYFlUP62/jCyiH8xliyW4pk65tNbLLDxD4i1631F4WiWfdSZgX3ZHwA7QgMpaEoRa9Pgee6NpzUBHgyWei9XKEnhfsIZtrx9wIJ824wnqOVqx6XkG8CCGipWyTy50xX5X/YG1YMknotRFvv8/cLar/Tdw5lj",

		 


	}

}
