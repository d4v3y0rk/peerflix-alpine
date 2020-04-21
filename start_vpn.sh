#!/bin/bash
openvpn --config /etc/openvpn/useast.ovpn --auth-user-pass /etc/openvpn/login.conf --daemon openvpn --log openvpn.log
