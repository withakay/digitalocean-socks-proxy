#!/bin/bash

IP_ADDRESS="$1"

if [ -z "$IP_ADDRESS" ]; then
    echo "No IP address provided."
    exit 1
fi

echo "Removing $IP_ADDRESS from known_hosts file..."
ssh-keygen -R "$IP_ADDRESS" 2>/dev/null || true

echo "Cleanup completed!"
