# terraform.tfvars

# AWS region
region = "eu-west-2"

# Hostname of Linux VM instance
hostname = "terraform-openvpn"

# VNET CIDR (/16)
vnet_cidr = "172.16.0.0/16"

# VM Shape
vm_size = "t2.micro"

# Public SSH Key path
ssh_public_key_path = "" # MUST BE ADDED

# Private SSH key path
ssh_private_key_path = "" # MUST BE ADDED
