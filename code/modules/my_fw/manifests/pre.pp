class my_fw::pre {
 	  Firewall {
   	    require => undef,
 	  }
 	  firewall { '000 accept all icmp':
       proto  => 'icmp',
       action => 'accept',
     }
     firewall { '000 allow 53 lo systemd_resolve input':
        chain => 'INPUT',
        iniface => 'lo',
        proto => 'all',
        dport => 53,
        destination => '127.0.0.53/8',
        action => 'accept',
    }
    firewall { '000 allow 53 non-lo systemd_resolve input':
        chain => 'INPUT',
        iniface => '! lo',
        proto => 'all',
        dport => 53,
        destination => '127.0.0.53/8',
        action => 'accept',
    }
    firewall { '000 allow 53 lo dnsmasq input':
        chain => 'INPUT',
        iniface => 'lo',
        proto => 'all',
        dport => 53,
        destination => '127.0.0.1/8',
        action => 'accept',
    }
    firewall { '000 allow 53 non-lo dnsmasq input':
        chain => 'INPUT',
        iniface => '! lo',
        proto => 'all',
        dport => 53,
        destination => '127.0.0.1/8',
        action => 'accept',
    }
     firewall { '001 accept all to lo interface':
       proto   => 'all',
       iniface => 'lo',
       action  => 'accept',
     }
     firewall { '002 reject local traffic not on loopback interface':
       iniface     => '! lo',
       proto       => 'all',
       destination => '127.0.0.1/8',
       action      => 'reject',
     }
     firewall { '003 accept related established rules':
       proto  => 'all',
       state  => ['RELATED', 'ESTABLISHED'],
       action => 'accept',
     }
}