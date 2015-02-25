# == Class: nodejs::prerequisites
#
# Ensure any required dependencies for nodejs are present.
#
# Parameters:
#
# None
#

class nodejs::prerequisites {

    include stdlib

    if (
        ($::operatingsystem == 'Ubuntu') and
        ($::operatingsystemrelease == '14.04')
    ) {

        $deps = [
            'software-properties-common'
        ]

    } elsif (
        ($::operatingsystem == 'Ubuntu') and
        ($::operatingsystemrelease == '12.04')
    ) {

        $deps = [
            'python-software-properties'
        ]

    }

    ensure_packages($deps)

    $common_deps = [
        'python',
        'g++',
        'make',
    ]

    ensure_packages($common_deps)

}
