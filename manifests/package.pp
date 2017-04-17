# Class: couchdb::package

class couchdb::package (
    $provider = undef
    $source    = undef
){
  package { 'couchdb':
    ensure  => installed,
    source => $source,
    provider => $provider,
  }
}
