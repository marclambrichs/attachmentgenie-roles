# This class can be used to setup a puppetmaster stack.
#
# @example when declaring the puppetmaster role
#  class { '::roles::puppetmaster': }
#
class roles::puppetmaster inherits roles::node {
  anchor { 'puppetmaster::begin': }
  -> class { '::profiles::cache': }
  -> class { '::profiles::database': }
  -> class { '::profiles::mq': }
  -> class { '::profiles::puppet': }
  -> anchor { 'puppetmaster::end': }

  if defined(Class['profiles::database::postgresql']) and defined(Class['profiles::puppet::puppetdb']) {
    Postgresql::Server::Db <||> -> Class['::puppetdb::server']
    Postgresql::Server::Db <||> -> Class['::puppetdb::server::validate_db']
  }

  if defined(Class['profiles::cache::memcached']) and defined(Class['profiles::puppet::foreman']) {
    Class['::memcached'] -> Class['::foreman']
  }
}
