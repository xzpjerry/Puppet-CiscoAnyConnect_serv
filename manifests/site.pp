node default {
	include self_update
	include sshd
	include pageserver
	include user_management
}