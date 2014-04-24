#
class mercurial::install {
  package {$mercurial::params::pkg: ensure => installed }
}
