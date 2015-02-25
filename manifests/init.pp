class nodejs {


    # validate_platform() function comes from
    # puppet module gajdaw/diverse_functions
    #
    #     https://forge.puppetlabs.com/gajdaw/diverse_functions
    #
    if !validate_platform($module_name) {
        fail("Platform not supported in module '${module_name}'.")
    }

    Exec { path => [
        '/usr/local/sbin',
        '/usr/local/bin',
        '/usr/sbin',
        '/usr/bin',
        '/sbin',
        '/bin'
    ]}

    class { 'nodejs::prerequisites': }

    exec { 'nodejs::update-repository':
        command => 'add-apt-repository ppa:chris-lea/node.js',
        require => Class['nodejs::prerequisites']
    }

    exec { 'nodejs::apt-get-update':
        command => 'apt-get update -y',
        require => [Exec['nodejs::update-repository']]
    }

    package { 'nodejs':
        ensure  => present,
        require => [Exec['nodejs::apt-get-update']]
    }

}
