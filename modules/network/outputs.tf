output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "default_subnet_id" {
  value = azurerm_subnet.default.id
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

