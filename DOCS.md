# Home Assistant Add-on: UACME Home Assistant ACME client

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons** -> **Add-on store**.
2. Find the "UACME Home Assistant ACME client" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

1. The ACME account to your registered domain should already be created. Make sure that the hook and config files exist in the `/ssl` directory.
2. In the UACME addon configuration, change the `domain` option to the domain name you want to auto-renew certificate. (from Letsencrypt or any other self-hosted you control).
4. Leave all other options as-is.
5. Save configuration.
6. Start the add-on.
7. Have some patience and wait a couple of minutes.
8. Check the add-on log output to see the result.

optional: `/ssl/certs/root_ca.crt` will include a root certificate to trust during certificate renewal and registration.


## Configuration

Add-on configuration:

```yaml
domain: home.example.com
acmedir: https://ca.example.com/acme/directory
hook: /ssl/nsupdate.sh
```

### Option: `domain` (required)

The server's fully qualified domain name to renew certificate for.

### Option: `acmedir` (optional)

The ACME directory path default for [Let's Encrypt](https://acme-v02.api.letsencrypt.org/directory).

### Option: `hook` (required)

UACME hook script to answer ACME challenges.

### Option: `eab` (optional)

EAB (External Account Binding) token to register new account with.

## Known issues and limitations

- Does not handle registering ACME account which is necessary with UACME.

## Troubleshooting

- TBF.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/Xavantex/hassio-uacme-addon/issues
[repository]: https://github.com/Xavantex/hassio-uacme-addon
