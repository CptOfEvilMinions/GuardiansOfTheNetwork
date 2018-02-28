#!/bin/bash

# Create sinkhole record
echo "zone $1 {type master; file \"/etc/bind/zones/blockeddomains.db\";};" >> /etc/bind/zones/blacklisted.zones

# Restart BIND server
sudo systemctl restart bind9.service