# Azure Location
variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

# Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group for all resources."
  type        = string
}

# Address Space for Virtual Network
variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"] # Default if not overridden
}

# Subnet Address Prefixes
variable "subnet_prefixes" {
  description = "List of address prefixes for the subnets in the virtual network."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Default values for app and bastion subnets
}

# Allowed IPs for Bastion and SSH Access
variable "allowed_ips" {
  description = "List of IP addresses allowed to access the Bastion Host and SSH (e.g., CIDR format)."
  type        = list(string)
}

# Azure Function App Configuration
variable "function_app_name" {
  description = "The name of the Azure Function App."
  type        = string
  default     = "hello-world-func"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

variable "bastion_host_name" {
  description = "The name of the bastion host"
  type        = string
}

variable "bastion_ip_label" {
  description = "The IP label for the bastion host"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan"
  type        = string
}

