# BEFORE EXECUTE THE SCRIPT PLEASE THE INSTRUCTION CAREFULLY 
# ----------------------------------------------------------
# Author : abhiram Das | abhiramdas99@gmail.com
# ----------------------------------------------------------
# Instructions - 
#1) Make sure to modify the interface, new_ip, new_subnet, new_gateway,
# and new_dns variables according to your network configuration.


#!/bin/bash

# Network interface name (e.g., eth0, enp0s3)
interface="eth0"

# New IP address, subnet mask, gateway, and DNS
new_ip="192.168.1.100"
new_subnet="255.255.255.0"
new_gateway="192.168.1.1"
new_dns="8.8.8.8"

# Backup the network configuration file
sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bak

# Create a new network configuration file
sudo tee /etc/netplan/01-netcfg.yaml > /dev/null << EOL
network:
  version: 2
  renderer: networkd
  ethernets:
    $interface:
      addresses:
        - $new_ip/$new_subnet
      gateway4: $new_gateway
      nameservers:
          addresses: [$new_dns]
EOL

# Apply the new network configuration
sudo netplan apply

# Print the updated network configuration
echo "Updated network configuration:"
cat /etc/netplan/01-netcfg.yaml
