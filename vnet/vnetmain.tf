resource "azurerm_virtual_network" "example" {
  for_each = var.networks

  name                = "vnet-${local.prefix}-${each.key}"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.key != "dummysubnet" ? "${local.prefix}-${subnet.key}-subnet" : subnet.key
      address_prefix = subnet.value.subnet_address_space
    }
  }
}


