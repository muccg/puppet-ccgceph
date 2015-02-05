#
class ccgceph ($ceph_fsid, $mon_secret) inherits ccgceph::params {
    # include repo::ceph

    package { $ccgceph::absent_packages:
        ensure  => absent
    }

    package { $ccgceph::packages:
        ensure  => present
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
    } -> 
    file {'/home/ceph/.ssh/':
        ensure => "directory"
    } -> 
    file {'/home/ceph/.ssh/authorized_keys':
      content => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDR5riAD3/sNQoAJce6LQo4HZQzKZzGPH/8SYKpyx7qQpRK0ivOpX4tUT4XuH+5z7jXG8sIijrC7/MmWGjwxPSNnEGxrakCmWKWWvbG721PH9+xyHsVz6onqSH+CIH2AJFFOZOizGjaXZles9/hKY47CPqmhtBSNbRojYArQTaWRFQU02mA7mKIW4oVMFsQjocs/6Q8hqDOAwzMlTbIhRyVAf7eD/A2mFImOK/zR9Zvw5AVro5oi1wI9vg2ynzHD3X3CTlH5IA3L4wkToMTJI4SkV+TRklGmZD5sTAHzg+NG18SH19Q8gK+4Kl0m9bVXhK1PUzPOCSpwRaTvpGqjIAj ceph@compute0"
    }
}
