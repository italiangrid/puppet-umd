# @summary Install UMD5 repositories.
#
# @param enable_contrib
# 
# @param enable_testing
#
# @example
#   include umd::umd5
#
class umd::umd5 (
  Boolean $enable_contrib = false,
  Boolean $enable_testing = false,
) {
  yumrepo { 'UMD-5':
    ensure   => present,
    descr    => 'UMD 5 main repository (Alma Linux 9)',
    baseurl  => 'https://repository.egi.eu/repository/umd/5/al9/release/$basearch',
    enabled  => 1,
    priority => 1,
    gpgcheck => 1,
    gpgkey   => 'https://repository.egi.eu/repository/umd/5/UMD-5-RPM-PGP-KEY',
  }
  if $enable_contrib {
    $enable_contrib_num = 1
  } else {
    $enable_contrib_num = 0
  }
  yumrepo { 'UMD-5-contrib':
    ensure   => present,
    descr    => 'UMD 5 contrib repository (Alma Linux 9)',
    baseurl  => 'https://repository.egi.eu/repository/umd/5/al9/contrib/$basearch',
    enabled  => $enable_contrib_num,
    priority => 1,
    gpgcheck => 1,
    gpgkey   => 'https://repository.egi.eu/repository/umd/5/UMD-5-RPM-PGP-KEY',
  }
  if $enable_testing {
    $enable_testing_num = 1
  } else {
    $enable_testing_num = 0
  }
  yumrepo { 'UMD-5-testing':
    ensure   => present,
    descr    => 'UMD 5 testing repository (Alma Linux 9)',
    baseurl  => 'https://repository.egi.eu/repository/umd/5/al9/testing/$basearch',
    enabled  => $enable_testing_num,
    priority => 1,
    gpgcheck => 1,
    gpgkey   => 'https://repository.egi.eu/repository/umd/5/UMD-5-RPM-PGP-KEY',
  }
}
