
variable "prefix" {
  type        = string
  default     = "ovpn"
  description = "Prefix to generate names"
}

variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "Azure region"
}

variable "hostname" {
  type        = string
  default     = "terraform-openvpn"
  description = "Hostname of OpenVPN instance"
}

variable "admin_username" {
  type        = string
  default     = "ubuntu"
  description = "OS username of ubuntu instance"
}

variable "vnet_cidr" {
  type        = string
  default     = "172.16.0.0/16"
  description = "CIDR block for VNET"
}

variable "vm_size" {
  type        = string
  default     = "t2.micro"
  description = "VM shape"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/aws-ssh.pub"
  description = "SSH public key path"
}

variable "ssh_private_key_path" {
  type        = string
  default     = "~/.ssh/aws-ssh"
  description = "SSH private key path"
}


# OpenVPN Install variables

variable "openvpn_install_script_path" {
  type        = string
  default     = "https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh"
  description = "OPENVPN script download path"
}
variable "auto_install" {
  type        = string
  default     = "y"
  description = "Autoinstall openVPN"
}

variable "approve_ip" {
  type        = string
  default     = "y"
  description = "Approve discovered IP"
}

variable "ipv6_support" {
  type        = string
  default     = "n"
  description = "IPV6 support"
}

variable "port_choice" {
  type        = string
  default     = "1"
  description = "Default port choice"
}

variable "protocol_choice" {
  type        = string
  default     = "1"
  description = "Default protocol choice"
}

variable "dns" {
  type        = string
  default     = "1"
  description = "Default DNS choice"
}

variable "compression_enabled" {
  type        = string
  default     = "n"
  description = "Default compression choice"
}

variable "customize_enc" {
  type        = string
  default     = "n"
  description = "No encryption customization"
}

variable "export_client" {
  type        = string
  default     = "client"
  description = "Client certificate name"
}

variable "pass" {
  type        = string
  default     = "1"
  description = "Proceed for install"
}