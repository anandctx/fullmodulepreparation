resource "azurerm_route_table" "routetable1" {
  name                          = "${local.prefix}-route-table"
  location                      = azurerm_resource_group.network.location
  resource_group_name           = azurerm_resource_group.network.name
  disable_bgp_route_propagation = false

  route {
    name                   = "everythingtofirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.100.1.4"
  }


}

resource "azurerm_subnet_route_table_association" "routetableassociation" {
  for_each       = local.subnet-extract-final
  subnet_id      = "${azurerm_virtual_network.example[each.value.vnetname].id}/subnets/${local.prefix}-${each.value.subnetname}-subnet"
  route_table_id = azurerm_route_table.routetable1.id
}