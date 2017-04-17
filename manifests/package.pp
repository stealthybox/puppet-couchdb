# Class: couchdb::package

class couchdb::package (
    $provider = undef
    $source   = undef
){
  package { 'couchdb':
    ensure  => installed,
    source => $couchdb::package::source,
    provider => $couchdb::package::provider,
  }
}
