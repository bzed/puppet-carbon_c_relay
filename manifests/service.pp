# carbon_c_relay::service
class carbon_c_relay::service {
    service { 'carbon-c-relay.service':
        ensure   => running,
        enable   => true,
        provider => systemd,
        require  => [
            Concat[$carbon_c_relay::config_file],
            Package['carbon-c-relay']
        ],
    }
}
