class physical {

  package { ['irqbalance', 'lm-sensors', 'dmidecode', 'binutils']:
    ensure => installed,
  }

  if $::has_infiniband == 'true' {

    include physical::infiniband
  }

  case $::manufacturer {

    'HP' :         { include physical::hp }
    'Dell Inc.' :  { include physical::dell }
    'Supermicro' : { include physical::supermicro }

  }

  if $::mdadm_devices != '' {

    include physical::mdraid
  }

  if $::has_nfs_mounts == 'true' {

    include physical::nfs
  }
}
