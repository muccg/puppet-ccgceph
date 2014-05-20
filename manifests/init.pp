#
class ccgceph ($ceph_fsid, $mon_secret) inherits ccgceph::params {
    include repo::ceph

    package { $ccgceph::absent_packages:
        ensure  => absent,
        require => Class['openstack']
    }

    package { $ccgceph::packages:
        ensure  => present,
        require => Class['openstack']
    }

    class { 'sudo':
        purge               => false,
        config_file_replace => false,
    } ->
    user { "ceph":
        ensure => present,
        managehome => true,
        shell => '/bin/bash',
        comment => "Ceph",
    } ->
    sudo::conf { 'ceph':
        priority => 10,
        content  => 'ceph ALL = (root) NOPASSWD:ALL',
    }
}
