node default {
	# include cron_puppet
	include self_update
	include sshd
}