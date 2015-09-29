#!/bin/bash
sh start_vpn.sh &
sleep 10
sh checkip.sh
lt --port 8888 &
/bin/bash
