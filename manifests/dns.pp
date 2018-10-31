# This class can be used to setup DNS
#
# @example when declaring the dns role
#  class { '::roles::dns': }
#
class roles::dns inherits roles::node {
  anchor { 'dns::begin': }
  -> class { '::profiles::dns': }
  -> anchor { 'dns::end': }
}
