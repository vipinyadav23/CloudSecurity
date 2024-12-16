output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "function_app_url" {
  value = azurerm_function_app.main.default_hostname
}
