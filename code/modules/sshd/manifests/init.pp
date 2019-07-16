class sshd {
	contain sshd::make_sure_package_and_service_are_good
	contain sshd::ssh_pub_key_list_to_be_imported

	Class['sshd::make_sure_package_and_service_are_good']
	-> Class['sshd::ssh_pub_key_list_to_be_imported']
}
