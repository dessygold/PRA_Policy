resource "azurerm_policy_set_definition" "pra_azure_baseline01" {
  name         = var.policy_definition_name
  policy_type  = "Custom"
  display_name = var.policy_definition_name
  management_group_name = var.management_group_name  # name only, id will throw error message 


# MFA should be enabled on accounts with owner permissions on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/aa633080-8b72-40c4-a2d7-d00c03e80bed"
  }

  # MFA should be enabled on accounts with write permissions on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
  }

   # MFA should be enabled on accounts with read permissions on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e3576e28-8b17-4677-84c3-db2990658d64"
  }

 # External accounts with read permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5f76cf89-fbf2-47fd-a3f4-b891fa780b60"
  }

  # External accounts with write permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
  }

  # External accounts with owner permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f8456c1c-aa66-4dfb-861a-25d127b775c9"
  }

# Azure Defender for servers should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4da35fc9-c9e7-4960-aec9-797fe7d9051d"
  }

# Azure Defender for Azure SQL Database servers should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7fe3b40f-802b-4cdd-8bd4-fd799c948cc2"
  }

# Azure Defender for Storage should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/308fbb08-4ab8-4e67-9b29-592e93fb94fa"
  } 

 # Azure Defender for App Service should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2913021d-f2fd-4f3d-b958-22354e2bdbcb"
  } 

   # Azure Defender for SQL servers on machines should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6581d072-105e-4418-827f-bd446d56421b"
  } 

   # Azure Defender for Key Vault should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0e6763cc-5078-4e64-889d-ff4d9a839047"
  }

   # Auto provisioning of the Log Analytics agent should be enabled on your subscription
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/475aae12-b88a-4572-8b36-9b712b2b3a17"
  }

   # Microsoft Defender for Containers should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1c988dd6-ade4-430f-a608-2a3e5b0a6d38"
  }

   # System updates should be installed on your machines
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/86b3d65f-7626-441e-b690-81a8b71cff60"
  }

  # Vulnerabilities in security configuration on your machines should be remediated
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e1e5fd5d-3e4c-4ce1-8661-7d1873ae6b15"
  } 

  # Monitor missing Endpoint Protection in Azure Security Center
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/af6cd1bd-1635-48cb-bde7-5b15693900b9"
  }

  # Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d"
  }

  # Adaptive network hardening recommendations should be applied on internet facing virtual machines
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/08e6af2d-db70-460a-bfe9-d5bd474ba9d6"
  }

  
} 



