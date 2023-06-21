module "network" {
  source     = "./vnet"
  for_each   = var.abc
  networks   = each.value
  location   = each.key
  fwvnetid   = module.firewall.fwvnetid
  fwvnetname = module.firewall.fwvnetname
  firewallrgname = module.firewall.firewallrg_out

}

module "firewall" {
  source = "./firewall"
  # vnet_location       = azurerm_resource_group.firewall.location
  # resource_group_name = azurerm_resource_group.firewall.name
  fwlocation = var.fwlocation
  firewallpolicyid = module.fwrule.fwpolicy_out


}


module "fwrule" {
  source           = "./firewallrules"
  fwpolicylocation = var.fwpolicylocation
  policylocation   = var.policylocation
  childpolicy      = var.childpolicy
  rulecollections  = var.rulecollections


}