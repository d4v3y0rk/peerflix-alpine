#!/bin/bash
openvpn --config /etc/openvpn/useast.ovpn --ca /etc/openvpn/ca.crt --crl-verify /etc/openvpn/crl.pem --auth-user-pass /etc/openvpn/login.conf --daemon openvpn --log openvpn.log
