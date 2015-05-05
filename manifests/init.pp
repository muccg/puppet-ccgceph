#
# TODO
#  - A lot of code to install one package??
class ccgceph {

    $absent_packages = [
    ]

    $packages = [
        'ceph-deploy'
    ]

    package { $ccgceph::absent_packages:
        ensure  => absent
    }

    package { $ccgceph::packages:
        ensure  => present
    }
}
