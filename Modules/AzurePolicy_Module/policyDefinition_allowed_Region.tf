# Azure Custom Policy Definition for Allowed Regions to deploy Resources
resource "azurerm_policy_definition" "regions" {
  name         = var.policy_definition_name_region
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = var.policy_definition_name_region
  management_group_name = var.management_group_name

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA


  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "location",
        "in": "[parameters('allowedRegions')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE


  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed regions",
        "strongType": "location"
      }
    }
  }
PARAMETERS

}