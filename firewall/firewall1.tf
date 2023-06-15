resource "azurerm_public_ip" "pubip" {
  name                = "${local.prefix}-firewall-public-ip"
  location            = var.vnet_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
  name                = "${local.prefix}-firewall-01"
  location            = module.fwnetwork.vnet_location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = module.fwnetwork.vnet_subnets[0]
    public_ip_address_id = azurerm_public_ip.pubip.id
  }
}

