variable "location" {
  description = "Azure location for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "bastion_subnet_id" {
  description = "ID of the subnet for Bastion"
  type        = string
}

variable "bastion_name" {
  description = "The name of the bastion host"
  type        = string
}

variable "bastion_ip_label" {
  description = "The IP label for the bastion host"
  type        = string
}

variable "allowed_ips" {
  description = "A list of allowed IPs for the bastion"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
