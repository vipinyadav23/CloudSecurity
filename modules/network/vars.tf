variable "location" {
  description = "Azure location for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The subnet address prefixes"
  type        = list(string)
}

variable "allowed_ips" {
  description = "Allowed source IPs for SSH access"
  type        = list(string)
}

