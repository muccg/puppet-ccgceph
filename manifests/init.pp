#
class ccgceph () inherits ccgceph::params {
    # we are doubling up monitor with osd for now (small rollout on the compute nodes)

    class { 'ceph': 
        fsid => $ceph_fsid,
        mon_host => 'compute0.bpa.ccg,compute1.bpa.ccg,compute2.bpa.ccg',
    }

    ceph::mon { $hostname: key => $ceph_mon_key }

    #ceph::key {'client.admin':
    #    secret => $ceph_admin_key,
    #    cap_mon => '*',
    #    cap_osd => '*',
    #    inject => true
    #}
    # ceph::key{'client.bootstrap-osd':
    #     secret => $ceph_bootstrap_osd_key,
    #     cap_mon => 'profile bootstrap-osd',
    #     inject => true
    # }
    # ceph::osd{'discover':}
}
