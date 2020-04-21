#!/bin/bash
cat openvpn.log
curl -s https://www.privateinternetaccess.com/pages/whats-my-ip/ | grep "You are protected" | grep -v li | awk {'print $1" "$2" "$3" "$4" "$5'}
