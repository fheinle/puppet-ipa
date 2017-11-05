# params for freeipa
class ipa::params {
  $realm = lookup('ipa::domain')
}
