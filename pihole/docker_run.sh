#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

IP="192.168.188.100"
PIHOLE_BASE=/share/CACHEDEV1_DATA/homes/admin 

# Note: ServerIP should be replaced with your external ip.
docker run -d \
    --name pihole \ 
    -v "${PIHOLE_BASE}/etc-pihole/:/etc/pihole/" \
    -v "${PIHOLE_BASE}/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    -e ServerIP=$IP \
    -e DNSMASQ_LISTENING=all \
    --net=host \
    --restart=unless-stopped \
    --ip=$IP \
	    --dns 127.0.0.1 --dns 1.1.1.1 \
    -e WEBPASSWORD="hello" \
    pihole/pihole:latest

printf 'Starting up pihole container '
#for i in {1..20}; do
#    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
#        printf ' OK'
#        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
#        exit 0
#    else
#        sleep 3
#        printf '.'
#    fi
#
#    if [ $i -eq 20 ] ; then
#        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
#        exit 1
#    fi
#done;
