class puppet {
	cron { "puppet apply":
		command => "cd /etc/puppet && git pull -q origin master && puppet apply-manifests/site.pp",
		user => root,
		minute => "*/5",

	}



}
