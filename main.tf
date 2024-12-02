
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "digitalocean_token" {
  type        = string
  description = "The public key to be added to the droplet"
}

variable "digitalocean_ssh_fingerprint" {
  type        = string
  description = "The finger print of a public key that has been added to your Digital Ocean Account."
}

variable "region" {
  type        = string
  description = "The region to deploy the droplet"
}

variable "droplet_size" {
  type        = string
  description = "The size of the droplet"
  default     = "s-1vcpu-512mb-10gb"
}

provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_droplet" "socks_vm" {
  image     = "ubuntu-24-04-x64"
  name      = "socks"
  region    = var.region
  size      = var.droplet_size
  user_data = file("cloud-config.yaml")
  ssh_keys = [
    "${var.digitalocean_ssh_fingerprint}"
  ]
}

output "ip_address" {
  value       = digitalocean_droplet.socks_vm.ipv4_address
  description = "The public IP address of your droplet."
}
