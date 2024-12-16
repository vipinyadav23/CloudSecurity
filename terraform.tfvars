# Azure Location
location = "East US"

# Resource Group Name
resource_group_name = "rg-terraform-setup"

# Address Space for Virtual Network
address_space = ["10.0.0.0/16"]

# Subnet Address Prefixes
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

# Allowed IPs for Bastion and SSH Access
allowed_ips = [
  "192.168.1.0/24", # List format with CIDR notation
  "10.0.0.0/16"
]

# Azure Function App Configuration
function_app_name = "hello-world-function"

# App Service Plan SKU
app_service_plan_sku = "Y1"

# Storage Account Name
storage_account_name = "helloworldstorageacct"

# Tags for Resources
tags = {
  Environment = "Production"
  Project     = "TerraformSetup"
}

# Bastion Host Configuration
bastion_host_name = "myBastionHost"

# Public IP Domain Name Label
bastion_ip_label = "bastion-eastus"

resource_group_name     = "rg-function-app"
storage_account_name    = "funcstorage123"
app_service_plan_name   = "function-app-plan"
function_app_name       = "hello-world-func"
