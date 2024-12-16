# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Virtual Network and Subnets Module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefixes
  allowed_ips         = var.allowed_ips
}

module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  bastion_subnet_id   = module.network.bastion_subnet_id["bastion"]
  bastion_name        = var.bastion_host_name
  bastion_ip_label    = var.bastion_ip_label
  allowed_ips         = var.allowed_ips
  tags                = var.tags
}

# Azure Function App and Storage Account
resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.function_app_name}-plan"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = var.app_service_plan_sku
  }
  tags = var.tags
}

resource "azurerm_function_app" "main" {
  name                       = var.function_app_name
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  app_service_plan_id        = azurerm_app_service_plan.main.id
  storage_account_name       = azurerm_storage_account.main.name
  storage_account_access_key = azurerm_storage_account.main.primary_access_key

  os_type       = "linux"
  version       = "~4"
  tags          = var.tags


  site_config {
    linux_fx_version = "python|3.9"
  }

app_settings {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }
}

