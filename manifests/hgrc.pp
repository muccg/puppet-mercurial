#
define mercurial::hgrc(
  $prefix,
  $username,
  $password,
  $owner,
  $group = $owner
  $hgrc = $title,
  ) {

  file { "${hgrc}":
    content => template('mercurial/user.hgrc.erb'),
    owner => $owner,
    group => $group,
    mode => '0400',
  }
}
