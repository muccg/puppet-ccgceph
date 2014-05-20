#
class ccgceph ($ceph_fsid, $mon_secret) inherits ccgceph::params {
    # puppet-ceph needs us to set this global path
    Exec {
      path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
    }

    # we are doubling up monitor with osd for now (small rollout on the compute nodes)
    class { 'ceph::conf':
      fsid => $ceph_fsid,
      auth_type => 'cephx',
      cluster_network => '10.0.1.0/24',
      public_network => '10.0.2.0/24'
    }

    ceph::mon { $hostnum:
      monitor_secret => $mon_secret,
      mon_port       => 6789,
      mon_addr       => $ipaddress_br100,
    }

    class { 'ceph::osd' :
      public_address  => $ipaddress_br100,
      cluster_address => $ipaddress_eth1,
    }
    ceph::osd::device { '/dev/sdc': }
    ceph::osd::device { '/dev/sdd': }
    ceph::osd::device { '/dev/sde': }
    ceph::osd::device { '/dev/sdf': }
    ceph::osd::device { '/dev/sdg': }
    ceph::osd::device { '/dev/sdh': }
    ceph::osd::device { '/dev/sdi': }
    ceph::osd::device { '/dev/sdj': }
    ceph::osd::device { '/dev/sdk': }
    ceph::osd::device { '/dev/sdl': }
}
