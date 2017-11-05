# request ssl certificate
define ipa::sslcert (
  String $fname,
  String $domain = $facts['::fqdn'],
  String $service = 'http',
) {

  exec { "ipa-certrequest-${domain}":
    command => "/usr/bin/ipa-getcert request -K '${service}/${domain}' -k '${fname}.key' -f '${fname}.crt' -N '${domain}'",
    creates => "${fname}.key",
    user    => 'root'
  }
}
