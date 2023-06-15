resource "azurerm_network_security_group" "nsg" {

  for_each = local.subnet-extract-final


  name                = "${each.value.subnetname}-${local.prefix}-nsg"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

}