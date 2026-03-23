# Home Assistant

![Home Assistant Icon](./railwayapp-homeassistant.svg)

Deploy Home Assistant on Railway using the official container image.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new)

## Environment variables

```bash
TZ=Europe/Berlin
```

## Persistent storage

Attach a Railway volume and mount to:

- `/config`

## Notes

- Home Assistant is usually run in a home network environment with local discovery.
- On Railway, cloud-only integrations work best.
- Keep `/config` on a persistent volume before adding integrations.
