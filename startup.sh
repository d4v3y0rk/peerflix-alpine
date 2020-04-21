#!/bin/bash
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sh start_vpn.sh &
sleep 10
sh checkip.sh
PORT=3000 peerflix-server &
/bin/bash
