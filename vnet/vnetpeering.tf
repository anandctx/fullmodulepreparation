resource "azurerm_virtual_network_peering" "peer1" {
  # for_each = local.subnet-extract-final
  for_each            = var.networks
  name                = "peervnettofw"
  resource_group_name = azurerm_resource_group.network.name
  #   virtual_network_name      = azurerm_virtual_network.example[each.value.vnetname].name
  virtual_network_name      = azurerm_virtual_network.example[each.key].name
  remote_virtual_network_id = var.fwvnetid
}

resource "azurerm_virtual_network_peering" "peer2" {
  # for_each = local.subnet-extract-final
  for_each            = var.networks
  name                = "peervnettofw"
  resource_group_name = var.firewallrgname
  #   virtual_network_name      = azurerm_virtual_network.example[each.value.vnetname].name
  virtual_network_name      = var.fwvnetname
  remote_virtual_network_id = azurerm_virtual_network.example[each.key].id
}