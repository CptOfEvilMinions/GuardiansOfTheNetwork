#!/bin/bash

# Add domain to blacklist
echo 'zone "$1" {type master; file "/etc/bind/zones/blockeddomains.db";};' >> /etc/bind/zones/blacklisted.zones

# Restart Bind9 DNS
systemctl restart bind