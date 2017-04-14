# Class: couchdb::config
#
# This module manages couchdb configuration
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class couchdb::config (
  $admin_name                 = $couchdb::admin_name,
  $admin_password             = $couchdb::admin_password,
  $allow_jsonp                = $couchdb::allow_jsonp,
  $authentication_handlers    = $couchdb::authentication_handlers,
  $bind_address               = $couchdb::bind_address,
  $couchdb_conf_dir           = $couchdb::couchdb_conf_dir,
  $database_dir               = $couchdb::database_dir,
  $delayed_commits            = $couchdb::delayed_commits,
  $default_handler            = $couchdb::default_handler,
  $document_size_unit         = $couchdb::document_size_unit,
  $include_sasl               = $couchdb::include_sasl,
  $javascript                 = $couchdb::javascript,
  $log_file                   = $couchdb::log_file,
  $log_level                  = $couchdb::log_level,
  $log_max_chunk_size         = $couchdb::log_max_chunk_size,
  $max_attachment_chunk_size  = $couchdb::max_attachment_chunk_size,
  $max_connections            = $couchdb::max_connections,
  $max_dbs_open               = $couchdb::max_dbs_open,
  $max_document_size          = $couchdb::max_document_size,
  $os_process_timeout         = $couchdb::os_process_timeout,
  $port                       = $couchdb::port,
  $reduce_limit               = $couchdb::reduce_limit,
  $require_valid_user         = $couchdb::require_valid_user,
  $secret                     = $couchdb::secret,
  $secure_rewrites            = $couchdb::secure_rewrites,
  $service_enable             = $couchdb::service_enable,
  $util_driver_dir            = $couchdb::util_driver_dir,
  $uri_file                   = $couchdb::uri_file,
  $vhost_global_handlers      = $couchdb::vhost_global_handlers,
  $view_index_dir             = $couchdb::view_index_dir,
) {

  include couchdb::params

  File {
    owner => 'couchdb',
    group => 'root',
    mode  => '0644',
  }

  file { $couchdb::couchdb_conf_dir:
    ensure => directory,
  }

  file { "${couchdb::couchdb_conf_dir}/default.ini":
    ensure  => file,
    content => template('couchdb/default.ini.erb'),
  }

}
