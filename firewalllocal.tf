locals {
  vnet_name                = "firewall-01-vnet"
  firewall_subnet_names    = ["AzureFirewallsubnet"]
  firewall_vnet_cidr_range = "10.160.0.0/16"
  firewall_subnet_prefixes = ["10.160.1.0/24"]
  firewall_rg_name         = "${local.prefix}-firewall-resource-group"
  prefix                   = "ibo-org-${var.fwlocation}"
  # fwlocation = "uksouth"

}