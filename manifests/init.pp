class nodejs {

  exec { 'nodejs::update-repository':
    command => "add-apt-repository ppa:chris-lea/node.js",
    path => '/usr/bin:/usr/sbin:/bin',
    require => [Package['python-software-properties', 'python', 'g++', 'make']]
  }

  exec { 'nodejs::apt-get-update':
    path => '/usr/bin',
    command => 'apt-get update',
    require => [Exec['nodejs::update-repository']]
  }

  package { "nodejs":
    ensure => present,
    require => [Exec['nodejs::apt-get-update']]
  }

}
