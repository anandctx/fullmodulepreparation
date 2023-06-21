resource "azurerm_firewall_policy_rule_collection_group" "fwrulecollection" {
  for_each           = var.rulecollections
  name               = each.value.name
  firewall_policy_id = azurerm_firewall_policy.fwparentpolicy[0].id
  priority           = 500
  dynamic "application_rule_collection" {
    for_each = each.value["applicationrules"]
    content {
      name     = application_rule_collection.value["name"]
      priority = application_rule_collection.value["priority"]
      action   = application_rule_collection.value["action"]
      dynamic "rule" {
        for_each = application_rule_collection.value["rules"]
        content {
          name = rule.value["name"]
          protocols {
            type = "Http"
            port = 80
          }
          protocols {
            type = "Https"
            port = 443
          }
          source_addresses  = rule.value["source"]
          destination_fqdns = rule.value["destination"]
        }
      }
    }
  }


}