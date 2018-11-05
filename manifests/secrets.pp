# This class can be used to setup a secrets stack.
#
# @example when declaring the secrets role
#  class { '::roles::secrets': }
#
class roles::secrets inherits roles::node {
  anchor { 'secrets::begin': }
  -> class { '::profiles::secrets': }
  -> anchor { 'secrets::end': }
}
