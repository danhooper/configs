#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker pull ghcr.io/esphome/esphome:stable
docker stop esphome || /bin/true
docker rm esphome || /bin/true

docker run -d \
  --name esphome \
  --privileged \
  --restart=unless-stopped \
  -e TZ=EST5EDT \
  -v "$SCRIPT_DIR/config":/config \
  -v /etc/localtime:/etc/localtime:ro \
  --network=host \
  ghcr.io/esphome/esphome:stable
