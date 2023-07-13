# output "out_a" {
#   value = var.networks
# }


output "c-1" {
  value = { for value in local.subnet-extract : value.subnetname => value }
}


output "c-2" {
  value = local.subnet-extract
}

output "c-3" {
  value = local.subnet-extract-final
}


output "subnetid_out" {
  for_each = var.networks

  value = azurerm_virtual_network.example[each.key].subnet.id
}