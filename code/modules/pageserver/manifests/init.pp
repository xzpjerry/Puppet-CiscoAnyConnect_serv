class pageserver {
	contain pageserver::make_sure_package_and_service_are_good
	contain pageserver::html_resources_to_be_imported

	# import html resources after packages are installed
	# and services are running
	Class['pageserver::make_sure_package_and_service_are_good']
	-> Class['pageserver::html_resources_to_be_imported']
}
