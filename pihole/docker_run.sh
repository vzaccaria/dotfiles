#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

IP="192.168.188.100"
PIHOLE_BASE=/share/CACHEDEV1_DATA/homes/admin 

# Note: ServerIP should be replaced with your external ip.
docker run -d --name pihole -v "${PIHOLE_BASE}/etc-pihole/:/etc/pihole/" -v "${PIHOLE_BASE}/etc-dnsmasq.d/:/etc/dnsmasq.d/" -e ServerIP=$IP -e DNSMASQ_LISTENING=all --net=--net=qnet-static-eth1 --restart=unless-stopped --ip=$IP --dns 127.0.0.1 --dns 1.1.1.1 -e WEBPASSWORD="hello" pihole/pihole:latest

printf 'Starting up pihole container '
