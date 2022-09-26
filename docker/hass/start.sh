#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker pull ghcr.io/home-assistant/home-assistant:stable
docker stop homeassistant || /bin/true
docker rm homeassistant || /bin/true

docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=EST5EDT \
  -v "$SCRIPT_DIR/config":/config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable
