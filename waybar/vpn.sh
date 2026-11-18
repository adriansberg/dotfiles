#!/bin/sh
# The bar's VPN module (config.jsonc): a lock in green with the names of the
# active NetworkManager VPN and WireGuard connections, or a dim unlock.
nmcli -t -f NAME,TYPE connection show --active | awk -F: '
    $2 == "vpn" || $2 == "wireguard" { n = n (n ? ", " : "") $1 }
    END { print n ? "<span color=\"#52c79a\">\xef\x80\xa3</span>  " n : "<span color=\"#5c7584\">\xef\x82\x9c  off</span>" }'
