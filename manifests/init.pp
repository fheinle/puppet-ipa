# init stuff
class ipa {
  include ipa::params

  # fix ssh key lookup
  package { 'sssd-tools':
    ensure => present,
  }

  service { 'sssd':
    ensure => 'running',
    name   => 'sssd',
    enable => true
  }

  ini_setting { 'Fix SSH Key lookup':
    ensure  => present,
    path    => '/etc/sssd/sssd.conf',
    section => "domain/${ipa::params::realm}",
    setting => 'ldap_user_certificate',
    value   => 'noSuchAttribute',
    notify  => Service['sssd'],
  }
}
