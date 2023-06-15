resource "azurerm_virtual_network" "example" {
  for_each = var.networks # answer is given in the root module where networks is each.value of var.abc

  name                = "vnet-${local.prefix}-${each.key}" #here each.key is dmz-01, non-dmz-01, etc
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnets # this is each.value.subnets of each.value extracted from var.abc
    content {
      # condition = if the each.key is bastion/gatewaysubnet, use the same name of the key 
      name           = subnet.key != "dummysubnet" ? "${local.prefix}-${subnet.key}-subnet" : subnet.key
      address_prefix = subnet.value.subnet_address_space
    }
  }
}




