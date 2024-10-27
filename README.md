# Home Assistant Add-on: UACME Home Assistant ACME client

Sets up an ACME certificate renewal with UACME.

![Supports aarch64 Architecture][aarch64-shield]

## About

Sets up an ACME cron job for certificate renewal, saving certificates into `/ssl`. It is typically used to update the Home Assistant Certificate for the NGINX proxy addon.

Make sure you have generated an ACME account with your ACME provider before you start this add-on. [Let's Encrypt](https://acme-v02.api.letsencrypt.org/directory) can generate a Let's Encrypt account that can be used by this add-on.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[discord]: https://discord.gg/c5DvZ4e
