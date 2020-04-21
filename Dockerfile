FROM node:12.16.2-alpine3.9

RUN apk update && apk add openvpn bash curl && rm -rf /var/cache/apk/*
RUN npm install -g peerflix-server
RUN npm install -g localtunnel

ADD useast.ovpn /etc/openvpn/useast.ovpn
ADD login.conf /etc/openvpn/login.conf
ADD resolv.conf resolv.conf
ADD start_vpn.sh start_vpn.sh
ADD checkip.sh checkip.sh
ADD startup.sh startup.sh

CMD sh startup.sh
EXPOSE 3000
