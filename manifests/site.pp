node default {
	# include cron_puppet
	include self_update
	include sshd
}

node ip-10-0-6-204 {
	include puppet
	include smartd
	include sshd
}

