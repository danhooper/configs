#!/bin/bash -e
# Lookups may not work for VPN / tun0
IP_LOOKUP="$(ip route get 8.8.8.8 | awk '{for(i=1;i<=NF;i++) if ($i=="src") print $(i+1)}')"
IPv6_LOOKUP="$(ip -6 route get 2001:4860:4860::8888 | awk '{for(i=1;i<=NF;i++) if ($i=="src") print $(i+1)}')"

# Just hard code these to your docker server's LAN IP if lookups aren't working
IP="${IP:-$IP_LOOKUP}"  # use $IP, if set, otherwise IP_LOOKUP
IPv6="${IPv6:-$IPv6_LOOKUP}"  # use $IPv6, if set, otherwise IP_LOOKUP

# Default of directory you run this from, update to where ever.
DOCKER_CONFIGS="$(pwd)"

echo -e "### Make sure your IPs are correct, hard code ServerIP ENV VARs if necessary\nIP: ${IP}\nIPv6: ${IPv6}"

#docker pull pihole/pihole:latest
docker stop pihole || /bin/true
docker rm pihole || /bin/true

# Default ports + daemonized docker container
# Environment variables for docker can be defined in --env-file .env file
docker run -d \
    --name pihole \
    --env-file .env \
    -p 18443:443/tcp \
    -p 53:53/tcp -p 53:53/udp \
    -p 18080:80 \
    --cap-add=NET_ADMIN \
	--cap-add CAP_SYS_NICE \
	--cap-add CAP_SYS_TIME \
    -v "${DOCKER_CONFIGS}/pihole/:/etc/pihole/" \
    -v "${DOCKER_CONFIGS}/dnsmasq.d/:/etc/dnsmasq.d/" \
    -e ServerIP="${IP}" \
    -e ServerIPv6="${IPv6}" \
    --restart=unless-stopped \
    --dns=127.0.0.1 --dns=8.8.8.8 \
    --add-host dsm920plus:192.168.1.200 \
    --add-host dsm920plus.dhoops.dev:192.168.1.200 \
    --add-host dsmbackup:192.168.1.99 \
    --add-host dsmbackup.dhoops.dev:192.168.1.99 \
    --add-host hass:192.168.1.200 \
    --add-host hass.dhoops.dev:192.168.1.200 \
    --add-host jellyfin:192.168.1.200 \
    --add-host jellyfin.dhoops.dev:192.168.1.200 \
    --add-host esphome:192.168.1.200 \
    --add-host esphome.dhoops.net:192.168.1.200 \
    --add-host pihole:192.168.1.200 \
    --add-host pihole.dhoops.dev:192.168.1.200 \
    --add-host dsm920plus.dhoops.net:192.168.1.200 \
    --add-host hass.dhoops.net:192.168.1.200 \
    --add-host jellyfin.dhoops.net:192.168.1.200 \
    --add-host pihole.dhoops.net:192.168.1.200 \
    --add-host raspberrypi.dhoops.net:192.168.1.124 \
    --add-host raspberrypi:192.168.1.124 \
    --add-host unifi.dhoops.net:192.168.1.1 \
    --add-host unifi:192.168.1.1 \
    pihole/pihole:latest


printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
