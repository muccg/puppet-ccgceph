#
class ccgceph::params {

    case $::hostname {
      /^compute([\d+])$/: {
        $hostnum = $1
      }
      default: {
        fail("${::hostname} does not match expected hostname pattern")
      }
    }

    $absent_packages = [
    ]

    $packages = [
    ]

    # must remain constant over a ceph cluster (nothing to do with cephfs)
    $ceph_fsid = 'E8FEB982-B17B-43BF-8E07-34CAF47A2F96'
    $ceph_admin_key = 'ZGFoTm9vMmllYjNSaU1vYTRpYTRPaHJpNUFmYWVkYWU='
    $ceph_mon_key = 'bWFoSDZpZWRvbzV0b2hsZXcwaGVldmFlZ2hhZThpdWo='
    $ceph_bootstrap_osd_key = 'cmFpN2dhaENoYWlwYWk1a2Vla2llbGVlNG1laTlub2g='
}
