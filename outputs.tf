# output "out_1" {
#   value = [for a, b in var.abc : b]
# }





# output "out_3" {
#   value = flatten([for key, value in var.abc : { for boy, toy in value : boy => toy.subnets }])
# }

# output "out_4" {
#   value = flatten([for key, value in var.abc : [for toy in value : toy.subnets]])
# }

