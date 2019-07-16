node ip-10-0-6-204 {
	include puppet
	include sshd
	include cron_puppet
	include self_update
}

