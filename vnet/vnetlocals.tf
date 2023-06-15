locals {
  prefix = "ibo-org-${var.location}"
  rgname = "${local.prefix}-resource-group"
  # the below flatten creates a map of the subnet portion from the tfvars in the root module
  # this creates a key value pair for the subnet configuration
  subnet-extract = flatten([
    for a, b in var.networks : [
      for c, d in b.subnets : {
        subnetname    = c
        vnetname      = a
        subnetaddress = d.subnet_address_space


      }
    ]
  ])

  subnet-extract-final = { for value in local.subnet-extract : value.subnetname => value }
}