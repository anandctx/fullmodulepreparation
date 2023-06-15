resource "azurerm_network_security_rule" "nsgrule" {
  for_each = local.subnet-extract-final
  name     = "${azurerm_network_security_group.nsg[each.key].name}-nsg-rule"
  # for the name we can also use the name relevant to the rule like "allow internet"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.network.name
  network_security_group_name = azurerm_network_security_group.nsg[each.key].name
}