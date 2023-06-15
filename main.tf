module "network" {
  source   = "./vnet"
  for_each = var.abc
  networks = each.value
  location = each.key
  fwvnetid = module.firewall.fwvnetid
}

module "firewall" {
  source              = "./firewall"
  vnet_location       = azurerm_resource_group.firewall.location
  resource_group_name = azurerm_resource_group.firewall.name
  fwlocation = var.fwlocation


}