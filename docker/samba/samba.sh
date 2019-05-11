docker stop samba
docker rm samba
docker run -it \
    --name samba \
    --net=host \
    --restart unless-stopped \
    -e TZ=EST5EDT \
    --env-file .env \
    -p 139:139 \
    -p 445:445 \
    -p 137:137/udp \
    -p 138:138/udp \
    -v /mnt/disk3/media:/share \
    -d dperson/samba \
    -n \
    -w xmen \
    -g "log level = 2" \
    -s "media;/share;yes;yes;yes;dhooper;dhooper;dhooper;media"
