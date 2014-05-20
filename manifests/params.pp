#
class ccgceph::params () {

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
}
