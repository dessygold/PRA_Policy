resource "azurerm_policy_set_definition" "pra_azure_baseline01" {
  name         = var.policy_definition_name
  policy_type  = "Custom"
  display_name = var.policy_definition_name
  management_group_id = var.management_group_id


# MFA should be enabled on accounts with owner permissions on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/aa633080-8b72-40c4-a2d7-d00c03e80bed"
  }

  # MFA should be enabled on accounts with write permissions on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
  }
}


