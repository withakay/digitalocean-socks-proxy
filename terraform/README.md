# Quick SOCKS5 Proxy with DigitalOcean

This project provides a quick way to set up a SOCKS5 proxy using a DigitalOcean droplet. It's designed for temporary use cases where you need to route traffic through a different geographical location, with easy setup and teardown to minimize costs.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed locally
- [DigitalOcean](https://www.digitalocean.com/) account
- DigitalOcean API token
- SSH key added to your DigitalOcean account

## Setup

1. Clone this repository
2. Copy `example.tfvars` to `terraform.tfvars`:
   ```bash
   cp example.tfvars terraform.tfvars
   ```
3. Edit `terraform.tfvars` and add your:
   - DigitalOcean API token
   - SSH key fingerprint from DigitalOcean
   - Preferred region (e.g., "nyc1", "lon1", "sgp1")

## Usage

### Create the Proxy

1. Plan the infrastructure:
   ```bash
   make plan
   ```

2. Create the droplet:
   ```bash
   make apply
   ```

3. Start the SOCKS5 proxy:
   ```bash
   make proxy
   ```
   This will start a SOCKS5 proxy on `localhost:12345`

### Configure Your Applications

Here's how to configure different browsers to use the SOCKS5 proxy:

#### Chrome
1. Open Settings
2. Search for "proxy" and click "Open your computer's proxy settings"
3. On macOS:
   - Click "Network" in System Settings
   - Select your active connection
   - Click "Details..."
   - Select "Proxies" tab
   - Enable "SOCKS Proxy"
   - Enter "localhost" for server and "12345" for port
   - Click "OK" and "Apply"

#### Firefox
1. Open Settings/Preferences
2. Search for "proxy" or scroll to Network Settings
3. Click "Settings..."
4. Select "Manual proxy configuration"
5. Enter "localhost" in "SOCKS Host" and "12345" for "Port"
6. Select "SOCKS v5"
7. Check "Proxy DNS when using SOCKS v5"
8. Click "OK"

#### Safari
1. Open System Settings
2. Click "Network"
3. Select your active connection
4. Click "Details..."
5. Select "Proxies" tab
6. Enable "SOCKS Proxy"
7. Enter "localhost" for server and "12345" for port
8. Click "OK" and "Apply"

Note: For Chrome and Safari on macOS, the proxy settings are shared as they both use the system's network settings.

### Destroy the Infrastructure

When you're done, destroy the droplet to stop incurring charges:
```bash
make destroy
```

## Security Features

- SSH key-based authentication only (password authentication disabled)
- Minimal Ubuntu 24.04 image
- Automatic system updates on first boot

## Cost Considerations

The default configuration uses the smallest available droplet size (`s-1vcpu-512mb-10gb`). Remember to destroy the infrastructure when not in use to avoid unnecessary charges.

## Troubleshooting

If you can't connect to the proxy:
1. Ensure your SSH key is properly added to DigitalOcean
2. Check if the droplet is running in your DigitalOcean dashboard
3. Verify your local SSH configuration can reach DigitalOcean servers

## License

This project is open source and available under the MIT license.
