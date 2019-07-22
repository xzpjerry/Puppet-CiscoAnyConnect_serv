class pageserver_jerryx {
	contain pageserver_jerryx::make_sure_package_and_service_are_good
	contain pageserver_jerryx::html_resources_to_be_imported

	# import html resources after packages are installed
	# and services are running
	Class['pageserver_jerryx::make_sure_package_and_service_are_good']
	-> Class['pageserver_jerryx::html_resources_to_be_imported']
}
