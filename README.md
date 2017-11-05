# FreeIPA

This module provides limited support for controlling FreeIPA with Puppet.

Currently, only requesting SSL certificates from the CA is implemented.

## Usage

To request an SSL certificate:

```puppet
ipa::sslcert { 'sometitle':
  fname   => "/etc/apache2/ssl/${facts['::fqdn']}",
  domain  => $facts['::fqdn'],
  service => 'http',
}
```

* `fname`: File name for certificate and private key, without file extension
* `domain`: only one *FQDN* is allowed here
* `service`: the kerberos principal to use for the SSL certificate

This will request the given certificate from FreeIPA's CA and set up `certmonger`
to monitor the certificate for expiration etc.
