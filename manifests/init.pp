# == Class: carbon_c_relay
#
# Full description of class carbon_c_relay here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'carbon_c_relay':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Paul O'Connor <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Paul O'Connor, unless otherwise noted.
#
class carbon_c_relay (
    $port                = 2003,
    $config_file         = '/etc/carbon-c-relay.conf',
    $defaults_file       = '/etc/default/carbon-c-relay',
    $workers             = 8,
    $batch_size          = 2500,
    $queue_size          = 25000,
    $statistics          = 60,
    $statistics_hostname = $::hostname,
    $version             = 'latest',

){

    if !is_numeric($port) {
        fail('$port must be an integer')
    }
    validate_string($config_file)
    if !is_numeric($workers) {
        fail('$workers must be an integer')
    }
    if !is_numeric($batch_size) {
        fail('$batch_size must be an integer')
    }
    if !is_numeric($queue_size) {
        fail('$queue_size must be an integer')
    }
    if !is_numeric($statistics) {
        fail('$statistics must be an integer')
    }

    class { 'carbon_c_relay::install':}->
    class { 'carbon_c_relay::config':}->
    class { 'carbon_c_relay::service':}
}
