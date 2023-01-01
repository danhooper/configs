docker pull lscr.io/linuxserver/jellyfin:latest
docker stop jellyfin
docker update --restart=no jellyfin
docker rename jellyfin jellyfin-`date -u +"%Y-%m-%dT%H%M%SZ"`

#  -e JELLYFIN_PublishedServerUrl=192.168.0.5 `#optional` \
#  -p 8920:8920 `#optional` \
#  -p 7359:7359/udp `#optional` \
#  -p 1900:1900/udp `#optional` \

docker run -d \
  --name=jellyfin \
  -e PUID=1029 \
  -e PGID=100 \
  -e TZ=America/NewYork \
  --net=host \
  -p 8096:8096 \
  -v /volume1/video/jellyfin:/config \
  -v /volume1/video/tv:/data/tvshows \
  -v /volume1/mythtv/recordings:/data/mythtv \
  -v /volume1/video/movies:/data/movies \
  -v /volume1/video/other:/data/other \
  -v /dev/dri:/dev/dri \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin:latest
