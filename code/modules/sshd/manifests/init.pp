class sshd {
	contain sshd::prelude
	contain sshd::action

	Class['sshd::prelude']
	-> Class['sshd::action']
}
