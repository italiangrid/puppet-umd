# @summary Install UMD4 repositories.
#
# @example
#   include umd::umd4
#
class umd::umd4 (
) {
  $el = $facts['os']['release']['major']
  case $el {
    '7' : {
      $umd_repo = 'http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm'
      package { 'umd-release':
        ensure => latest,
        source => $umd_repo,
      }
    }
    default : {
      fail('Unsupported platform for UMD repositories')
    }
  }
}
