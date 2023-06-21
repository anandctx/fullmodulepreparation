resource "azurerm_resource_group" "parent_firewall_policy" {
  count    = var.isglobalpolicy ? 1 : 0
  name     = local.fwparentpolicyrg
  location = var.policylocation
}