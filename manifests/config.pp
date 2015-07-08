#carbon_c_relay config
class carbon_c_relay::config () {

    $daemon_args=join([
        "-f ${::carbon_c_relay::config_file}",
        "-p ${::carbon_c_relay::port}",
        "-w ${::carbon_c_relay::workers}",
        "-b ${::carbon_c_relay::batch_size}",
        "-q ${::carbon_c_relay::queue_size}",
        "-S ${::carbon_c_relay::statistics}",
        "-H ${::carbon_c_relay::statistics_hostname}",
        ], ' ')

        file { $::carbon_c_relay::defaults_file :
            ensure  => present,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => "# MANAGED BY PUPPET!!\nDAEMON_ARGS='${daemon_args}'",
            nofify  => Service['carbon-c-relay.service']
        }

        concat { $::carbon_c_relay::config_file:
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            notify => Service['carbon-c-relay.service']
        }

        concat::fragment { '01-relay-header':
            target  => $::carbon_c_relay::config_file,
            order   => '01',
            content => "# This file managed by Puppet\n",
        }

}
