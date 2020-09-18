# @summary Install UMD4 repositories.
#
# @example
#   include umd4
class umd4 {

  $platform = $::operatingsystemmajrelease
  case $platform {
    '6' : {
      $umd_repo = 'http://repository.egi.eu/sw/production/umd/4/sl6/x86_64/updates/umd-release-4.1.3-1.el6.noarch.rpm'
    }
    '7' : {
      $umd_repo = 'http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm'
    }
    default : {
      fail('Unsupported platform for UMD-4')
    }
  }
  package { 'umd-release':
    ensure => installed,
    source => $umd_repo,
  }

}
