class user_management {
  define myuser(
    $ssh_key,
    $ssh_key_type,
    $expiry = '2032-03-22',
    $shell  = '/bin/bash',
  ) {
    user { $title:
      ensure           => present,
      managehome       => true,
      comment          => 'Puppet managed user',
      home             => "/home/${title}",
      shell            => $shell,
      expiry           => $expiry,
    }
    ssh_authorized_key { $title:
      user => $title,
      type => $ssh_key_type,
      key => $ssh_key,
    }
  }
  contain user_management::users_to_be_imported
}
