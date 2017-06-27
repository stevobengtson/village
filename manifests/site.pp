include apt
include redis
include postgresql

class { 'apt':
  always_apt_update => true,
}

class { 'redis':
  bind => '0.0.0.0',
}

# Forcibly activate the en_US.UTF-8 locale. Needed to have
# UTF8 encoding in PostgreSQL databases.
file { '/etc/default/locale':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  content => "LANG=en_US.UTF-8\n",
} ->
# Install PostgreSQL 9.4 server from the PGDG repository
class { 'postgresql::globals':
  version             => '9.4',
  manage_package_repo => true,
  encoding            => 'UTF8',
  locale              => 'en_US.utf8',
} ->
class { 'postgresql::server':
  listen_addresses           => '*',
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  postgres_password          => 'password',
}

# Install contrib modules
class { 'postgresql::server::contrib':
  package_ensure => 'present',
}

postgresql::server::db { 'village_development':
  user     => 'village',
  password => postgresql_password('village', 'M3WgZtABAvcMsygJ'),
}

postgresql::server::db { 'village_test':
  user     => 'village',
  password => postgresql_password('village', 'M3WgZtABAvcMsygJ'),
}
