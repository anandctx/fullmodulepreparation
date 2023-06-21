output "fwpolicy_out" {
    value = azurerm_firewall_policy.fwchildpolicy["policy1"].id
}