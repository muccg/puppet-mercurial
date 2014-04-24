#
define mercurial::clone(
    $hgroot,
    $projectname = $title,
    $revision = 'default',
    $pwd = '/usr/local/src') {

  require mercurial

  exec { "hg clone $hgroot -u $revision $projectname":
    command   => "${mercurial::params::bin} clone $hgroot -u $revision $projectname",
    cwd       => $pwd,
    timeout   => $mercurial::params::timeout,
    logoutput => true,
    unless    => "/usr/bin/stat $pwd/$projectname";
  } ->

  exec { "hg pull -u $revision in $pwd/$projectname":
    command   => "${mercurial::params::bin} pull -u -r $revision",
    cwd       => "$pwd/$projectname",
    logoutput => true,
    timeout   => $mercurial::params::timeout,
  }
}
