resource "azurerm_bastion_host" "bastion" {
  name                = "myBastionHost"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_ip.id
  }
  tags = {
    Environment = "Production"
  }
}

resource "azurerm_public_ip" "bastion_ip" {
  name                         = "bastion-ip"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  allocation_method            = "Static"
  sku                          = "Basic"
  domain_name_label            = "bastion-${var.location}"

  tags = {
    Environment = "Production"
  }
}

