VERSION=2023.4.2-amd64
docker stop cloudflared || /bin/true
docker rm cloudflared || /bin/true
docker run --detach --name cloudflared --restart always --network host -v "${PWD}/config":/etc/cloudflared cloudflare/cloudflared:"$VERSION" tunnel --config /etc/cloudflared/hass-dhoops-net.yml --origincert /etc/cloudflared/cert.pem run hass-dhoops-net 
