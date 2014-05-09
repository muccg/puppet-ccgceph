#
class ccgceph () inherits ccgceph::params {
    # we are doubling up monitor with osd for now (small rollout on the compute nodes)

    ceph::conf {
        fsid => $ceph_fsid,
        mon_host => 'compute0.bpa.ccg,compute1.bpa.ccg,compute2.bpa.ccg',
    };
ceph::mon { $hostname: key => $ceph_mon_key }
    ceph::key {'client.admin':
        secret => ceph_admin_key,
        caps_mon => '*',
        caps_osd => '*',
        inject => true
    }
    cceph::key{'client.bootstrap-osd':
        secret => $ceph_bootstrap_osd_key,
        caps_mon => 'profile bootstrap-osd',
        inject => true
    }
    ceph::osd{ 'discover' };
    ceph::key{'client.bootstrap-osd':
        keyring => '/var/lib/ceph/bootstrap-osd/ceph.keyring',
        secret => $ceph_bootstrap_osd_key,
    }
}
