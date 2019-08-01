class ocserv {
	contain ocserv::make_sure_package_and_service_are_good
	contain ocserv::pass

	Class['ocserv::make_sure_package_and_service_are_good']
	-> Class['ocserv::pass']
}
