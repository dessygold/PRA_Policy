resource "azurerm_management_group_policy_assignment" "pra_azure_baseline01_assignment" {
  name                 = var.policy_assignment_name
  #scope                = var.policy_assignment_scope
  management_group_id  = var.policy_assignment_scope
  policy_definition_id = var.policy_definition_id
  description          = "Policy Assignment created via terraform for the azure baseline policy definition"
  display_name         = "${var.policy_assignment_name}-pra"
  location             = var.location
  identity { type = "SystemAssigned" }

  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "value": ${jsonencode(var.allowedRegions)}
      },
     "listOfAllowedSKUs": {
      "value": ${jsonencode(var.listOfAllowedSKUs)}
    }
  }
PARAMETERS
}