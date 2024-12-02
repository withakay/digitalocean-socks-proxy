#!/bin/bash

# Get the IP address from terraform output
IP_ADDRESS=$(terraform output -raw ip_address)

if [ -z "$IP_ADDRESS" ]; then
    echo "No IP address found. The droplet may already be destroyed."
    exit 0
fi

echo "Removing $IP_ADDRESS from known_hosts file..."
ssh-keygen -R "$IP_ADDRESS" 2>/dev/null || true

echo "Cleanup completed!"
