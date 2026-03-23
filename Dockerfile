FROM ghcr.io/home-assistant/home-assistant:stable

COPY --chmod=0755 docker-entrypoint.sh /usr/local/bin/railway-homeassistant-entrypoint
