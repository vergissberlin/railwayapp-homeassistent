# Home Assistant

![Home Assistant Icon](./railwayapp-homeassistant.svg)

Deploy Home Assistant on Railway using the official container image with Railway-ready proxy handling.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new)

## Files in this template

- `Dockerfile` uses `ghcr.io/home-assistant/home-assistant:stable`.
- `docker-entrypoint.sh` configures trusted reverse proxies and forwards Railway's dynamic `$PORT` to Home Assistant's internal `8123`.
- `railway.toml` defines start command, health check path, and restart policy.

## Environment variables

```bash
TZ=Europe/Berlin
```

Railway provides `PORT` automatically at runtime.

## Domain and health check

- Public domain is routed to service target port `8123`.
- Health check uses `/manifest.json`.
- First startup can take several minutes while Home Assistant initializes.

## Persistent storage

Attach a Railway volume and mount to:

- `/config`

## Notes

- Home Assistant expects reverse-proxy headers when deployed behind Railway edge.
- Local network auto-discovery integrations are limited in cloud environments.
- Keep `/config` on a persistent volume before adding integrations.
