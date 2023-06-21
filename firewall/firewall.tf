module "fwnetwork" {
  source              = "Azure/vnet/azurerm"
  version             = "3.0.0"
  vnet_name           = local.vnet_name
  vnet_location       = azurerm_resource_group.firewall.location
  resource_group_name = azurerm_resource_group.firewall.name # we cannot reference the rg from below as this is public module
  address_space       = [local.firewall_vnet_cidr_range]
  subnet_names        = local.firewall_subnet_names
  subnet_prefixes     = local.firewall_subnet_prefixes

}

resource "azurerm_resource_group" "firewall" {
  name     = local.firewall_rg_name
  location = var.fwlocation

}

