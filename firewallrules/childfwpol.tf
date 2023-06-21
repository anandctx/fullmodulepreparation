resource "azurerm_firewall_policy" "fwchildpolicy" {
  for_each            = { for a, b in var.childpolicy : a => b if b.create } #when value create is true in tfvars, one extra resource created with each.value.location
  name                = "fw-child-policy-${each.value.location}"
  resource_group_name = azurerm_resource_group.fwchildpolicy[each.key].name
  location            = var.policylocation # all policy in same location uksouth
  base_policy_id      = azurerm_firewall_policy.fwparentpolicy[0].id
  sku = "Standard"

  dynamic "intrusion_detection" {
    # for_each = try (each.value.mode, null) == null ? [] : [each.value] # works perfectly
    # for_each = [1]
    # for_each = [[for a in var.childpolicy :a]]
    # for_each = [[for a in var.childpolicy :a if each.value.mode != ""]] #- does not work if the mode value does not exist
    for_each = [each.value]
    content {
      mode = try(each.value.mode, null) # mode = each.value.mode 
    }
  }
}
resource "azurerm_resource_group" "fwchildpolicy" {
  for_each = { for a, b in var.childpolicy : a => b if b.create } #when value create is true in tfvars, one extra resource created
  name     = "fwchildpolicy-${each.value.location}-rg"
  location = each.value.location

}