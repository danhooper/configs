docker pull jacobalberty/unifi:latest
docker stop unifi
docker update --restart=no unifi
docker rename unifi unifi-`date -u +"%Y-%m-%dT%H%M%SZ"`
docker run --net=host --restart=always --init -d -p 8080:8080 -p 8443:8443 -p 3478:3478/udp -p 10001:10001/udp -e TZ='America/New_York' -e RUNAS_UID0=false \
    -v ~/unifi:/unifi \
	-v /volume1/certs/dhoops.dev:/unifi/cert \
	--name unifi jacobalberty/unifi:latest

