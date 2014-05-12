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
    # NB these are samples, change these before going live... - GB
    $ceph_fsid = 'E8FEB982-B17B-43BF-8E07-34CAF47A2F96'
    $ceph_admin_key = 'AQCTg71RsNIHORAAW+O6FCMZWBjmVfMIPk3MhQ=='
    $ceph_mon_key = 'AQDesGZSsC7KJBAAw+W/Z4eGSQGAIbxWjxjvfw=='
    $ceph_bootstrap_osd_key = 'AQABsWZSgEDmJhAAkAGSOOAJwrMHrM5Pz5On1A=='
}
