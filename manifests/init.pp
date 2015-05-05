#
# TODO
#  - why is hostnum declared?
#  - why are params passed through? compute?
#  - A lot of code to install one package??
class ccgceph ($ceph_fsid, $mon_secret) {


    case $::hostname {
      /^compute(\d+)$/: {
        $hostnum = $1
      }
      # match docker test node name
      /^computenode$/: {
        $hostnum = $1
      }
      /^ceph(\d+)$/: {
        $hostnum = $1
      }
      default: {
        fail("${::hostname} does not match expected hostname pattern")
      }
    }

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
