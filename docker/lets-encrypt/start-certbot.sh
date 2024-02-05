#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SECRETS_DIR="${SECRETS_DIR:-$SCRIPT_DIR/secrets}"
SECRETS_FILE="${SECRETS_FILE:-cloudflare.ini}"

if [ -f "$SCRIPT_DIR/certbot.env" ]; then
  source "$SCRIPT_DIR/certbot.env"
fi

if [ ! -f "$SECRETS_DIR/$SECRETS_FILE" ]; then
  echo "Did not find $SECRETS_DIR/$SECRETS_FILE containing cloudflare dns creds"
  exit 1
fi

if [ -z "$DOMAIN" ]; then
  echo "Provide a DOMAIN environment variable"
  exit 1
fi

if [ -z "$EMAIL" ]; then
  echo "Provide an EMAIL environment variable"
  exit 1
fi

mkdir -p "$SCRIPT_DIR/letsencrypt"

docker pull certbot/dns-cloudflare:latest
docker stop certbot || /bin/true
docker update --restart=no certbot || /bin/true
docker rm certbot || /bin/true

docker run --name certbot \
    --network host \
    -v "$SECRETS_DIR:/secrets" \
    -v "$SCRIPT_DIR/letsencrypt:/etc/letsencrypt" \
	certbot/dns-cloudflare \
	certonly \
	--dns-cloudflare \
	--dns-cloudflare-credentials "/secrets/$SECRETS_FILE" \
	-d "$DOMAIN" \
	-m "$EMAIL" \
	--noninteractive \
	--agree-tos \
	--dns-cloudflare-propagation-seconds 120
