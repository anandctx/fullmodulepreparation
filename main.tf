module "network" {
  source   = "./vnet"
  for_each = var.abc
  networks = each.value
  location = each.key





}