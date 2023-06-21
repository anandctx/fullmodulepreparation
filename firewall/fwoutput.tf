output "fw_subnet_id" {
  value = azurerm_firewall.fw.ip_configuration[0].subnet_id
}

output "fw_ipconfig_name" {
  value = azurerm_firewall.fw.ip_configuration[0].name
}


output "fwvnetid" {
  value = module.fwnetwork.vnet_id
}

output "fwvnetname" {
  value = module.fwnetwork.vnet_name
}

output "firewallrg_out" {
    value = azurerm_resource_group.firewall.name
}