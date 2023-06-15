# output "out_1" {
#   value = [for a, b in var.abc : b]
# }





# output "out_3" {
#   value = flatten([for key, value in var.abc : { for boy, toy in value : boy => toy.subnets }])
# }

# output "out_4" {
#   value = flatten([for key, value in var.abc : [for toy in value : toy.subnets]])
# }



# output "temp_ot" {
#   value = module.network.temp_out
# }

output "m-1" {
  value = module.network["northeurope"].c-1
}

output "m-2" {
  value = module.network["northeurope"].c-2
}

output "m-3" {
  value = { for k, v in module.network["northeurope"].c-1 : k => v }
}

output "m-4" {
  # if regexall function is used, and if dummysubnet is present in the keyvalue pair, 
  #the output will not have dummy subnet. 
  #This is used to stop assigning the nsg to the gatewaysubnet and similar ones
  value = { for k, v in module.network["northeurope"].c-1 : k => v } #if length(regexall(".*dummysubnet*", k)) == 0 }
}

output "m-5" {
  value = module.network["northeurope"].c-3
}

output "fw_subnet_ids" {
  value = module.firewall.fw_subnet_id
}

output "fw_ipconfig_name" {
  value = module.firewall.fw_ipconfig_name
}

output "fwvnetid" {
  value = module.firewall.fwvnetid
}

output "fwvnetname" {
  value = module.firewall.fwvnetname
}


