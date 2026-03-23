# Deploy and Host Home Assistant on Railway

![Home Assistant Icon](./railwayapp-homeassistant.svg)

Home Assistant is an open-source home automation platform that lets you connect devices, create automations, and manage dashboards from one place. This template packages Home Assistant for Railway with a proxy-aware startup flow and health checks.

## About Hosting Home Assistant

Home Assistant normally listens on port `8123` and is often used in local network setups. On Railway, traffic arrives through a reverse proxy and a dynamic runtime port (`PORT`). This template maps Railway's dynamic port to Home Assistant's internal `8123`, enables trusted proxy handling in `configuration.yaml`, and applies health checks via `railway.toml`.

## Common Use Cases

- Smart home dashboards and automations reachable from the public internet.
- Cloud-hosted Home Assistant instances for remote-first setups.
- Testing Home Assistant integrations without managing your own VM.

## Dependencies for Home Assistant Hosting

- **Container runtime**: Docker-based deploy using the official `ghcr.io/home-assistant/home-assistant:stable` image.
- **Persistent storage**: Railway volume mounted at `/config` for durable configuration and state.
- **Railway runtime config**: `PORT` is injected by Railway and routed to internal `8123`.

### Deployment Dependencies

- [Home Assistant documentation](https://www.home-assistant.io/docs/)
- [Railway documentation](https://docs.railway.com/)
- [Railway health checks](https://docs.railway.com/deploy/healthchecks)

### Implementation Details

- `Dockerfile` copies a custom entrypoint into the official Home Assistant image.
- `docker-entrypoint.sh`:
  - adds proxy configuration (`use_x_forwarded_for`, `trusted_proxies`) if missing,
  - runs a `socat` port bridge from `${PORT}` to `127.0.0.1:8123`,
  - starts Home Assistant via `/init`.
- `railway.toml`:
  - uses Dockerfile builder,
  - sets start command to `/usr/local/bin/railway-homeassistant-entrypoint`,
  - sets health check path to `/manifest.json`,
  - keeps restart policy on failure.

## Why Deploy Home Assistant on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you do not have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Home Assistant on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
