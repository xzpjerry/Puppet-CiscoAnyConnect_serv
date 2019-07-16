class self_update {
    cron { 'puppet-apply':
        command => "cd /etc/puppet && git pull && puppet apply -t manifests/site.pp",
        user    => root,
        minute  => "*/5",
    }
}