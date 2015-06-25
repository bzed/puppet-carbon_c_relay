# carbon_c_relay::service
class carbon_c_relay::service {
    service { 'carbon-c-relay':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        restart    => '/etc/init.d/relay reload',
        require    => [ Concat[$carbon_c_relay::config_file],
        File['/etc/init.d/relay'],
        Package['carbon-c-relay']
        ],
    }
}
