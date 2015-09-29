FROM mhart/alpine-node:0.12.7

RUN apk update && apk add openvpn bash curl && rm -rf /var/cache/apk/*
RUN npm install -g peerflix
RUN npm install -g localtunnel

ADD useast.ovpn /etc/openvpn/useast.ovpn
ADD ca.crt /etc/openvpn/ca.crt
ADD crl.pem /etc/openvpn/crl.pem
ADD login.conf /etc/openvpn/login.conf
ADD start_vpn.sh start_vpn.sh
ADD checkip.sh checkip.sh
ADD startup.sh startup.sh

CMD sh startup.sh
EXPOSE 51999
