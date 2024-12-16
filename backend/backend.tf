provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "backend" {
  name     = "backend-rg"
  location = "East US"
}

resource "azurerm_storage_account" "backend" {
  name                     = "backendstorageacct"
  resource_group_name       = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.backend.name
}

output "storage_account_name" {
  value = azurerm_storage_account.backend.name
}

output "container_name" {
  value = azurerm_storage_container.backend.name
}

