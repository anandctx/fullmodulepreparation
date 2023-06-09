resource "azurerm_resource_group" "network" {
  name     = local.rgname
  location = var.location
}