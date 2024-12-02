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

Configure your applications to use the SOCKS5 proxy:
- Host: localhost
- Port: 12345
- Protocol: SOCKS5

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
