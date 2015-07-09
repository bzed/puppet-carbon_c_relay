#rewrite <expression>
#    into <replacement>
#    ;
#
define carbon_c_relay::rewrite(
    $expression                    = '',
    $replacement                   = '',
    $order                         = '30',
) {

    validate_string($expression)
    validate_string($replacement)

    concat::fragment { "b_config/rewrite-${title}":
        target  => $carbon_c_relay::config_file,
        content => template('carbon_c_relay/config/rewrite.erb'),
        order   => $order,
    }
}
