# Class: sudoers
#
# Description
#   This module is designed to install and manage Sudo, 
#   Sudo is a program for some Unix and Unix-like computer 
#   operating systems that allows users to run programs 
#   with the security privileges of another user (normally 
#   the superuser, or root). It is an abbreviation for 
#   "substitute user do"
#
#   This module has been built and tested on RHEL and Ubuntu systems.
#
# Parameters:
#  $timeout - The default time in minutes that a sudo authentication is 
#             good for.
#  $default_group - Automatically add groups that are appropriate for a 
#                   particular platform (default: true, setting this to false 
#                   can cause bad things to happen if you don't know what you
#                   are doing)
#
# Actions:
#   This module will install Sudo packages, and setup the File Fragment
#   pattern necessary to assemble the Sudo file.
#
# Requires:
#  - Class[stdlib]. This is Puppet Labs standard library to include additional methods for use within Puppet. [https://github.com/puppetlabs/puppetlabs-stdlib]
#
# Sample Usage:
#  sudoers::entry { 'james': 
#    ensure   => 'present',
#    nopasswd => 'true',
#    noexec   => 'true',
#    commands => ['/bin/cat', '/usr/bin/vim'],
#    user     => ['phil', 'roger'],
#  }
class sudoers (
  $timeout       = 30,
  $default_group = true,
) inherits sudoers::params {

  anchor { 'sudoers::begin': }
  -> class { 'sudoers::package': }
  -> class { 'sudoers::config': }
  -> anchor { 'sudoers::end': }
}
