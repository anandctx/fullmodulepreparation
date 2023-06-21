resource "azurerm_firewall_policy" "fwparentpolicy" {
  count               = var.isglobalpolicy ? 1 : 0 #ifvar.islobalpolicyistrue it will create or else it will not create
  name                = local.fwparentpolicyname
  resource_group_name = azurerm_resource_group.parent_firewall_policy[count.index].name
  location            = var.policylocation # all policy in same location uksouth
}