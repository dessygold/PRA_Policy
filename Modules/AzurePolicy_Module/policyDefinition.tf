resource "azurerm_policy_set_definition" "pra_azure_baseline01" {
  name         = var.policy_definition_name
  policy_type  = "Custom"
  display_name = var.policy_definition_name
  management_group_name = var.management_group_name  # name only, id will throw error message 

  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed regions",
        "strongType": "location"
      }
    },
    "listOfAllowedSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed Virtual machine SKUs.",
        "displayName": "Allowed vm SKUs",
        "strongType": "VMSKUs"
      }
    }
}
PARAMETERS

# Custom Policy1:  Allowed Regions/Locations to deploy Azure Resources
policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.regions.id
    parameters = {
      "allowedRegions" = "[parameters('allowedRegions')]"
    }
  }

 # Built-In with Custom Parameters: Allowed Virtual Machine size (SKUs)
policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/########"
    parameters = {
      "listOfAllowedSKUs" = "[parameters('listOfAllowedSKUs')]"
    }
  }
# MFA should be enabled on accounts with owner permissions on your subscription
# Policy definition id obtain from the azure portal
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

   # Auditing on SQL server should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9"
  }

  # Subnets should be associated with a Network Security Group
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
  } 

  # Internet-facing virtual machines should be protected with network security groups
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
  } 

  # A vulnerability assessment solution should be enabled on your virtual machines
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/501541f7-f7e7-4cd6-868c-4190fdad3ac9"
  }

# Management ports of virtual machines should be protected with just-in-time network access control
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b0f33259-77d7-4c9e-aac6-3aabcfae693c"
  }

  # Adaptive application controls for defining safe applications should be enabled on your machines
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/47a6b606-51aa-4496-8bb7-64b11cf66adc"
  }

   # Transparent Data Encryption on SQL databases should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12"
  }

 # Subscriptions should have a contact email address for security issues
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7"
  }

  # Email notification for high severity alerts should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
  }

  # Email notification to subscription owner for high severity alerts should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0b15565f-aa9e-48ba-8619-45960f2c314d"
  }

  # Secure transfer to storage accounts should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
  }

  # [Preview]: Storage account public access should be disallowed
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4fa4b6c0-31ca-4c0d-b10d-24b96f62a751"
  }

   # Storage accounts should restrict network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
  }

   # Storage accounts should allow access from trusted Microsoft services
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c9d007d0-c057-4772-b18c-01e546713bcd"
  }

   # SQL Auditing settings should have Action-Groups configured to capture critical activities
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7ff426e2-515f-405a-91c8-4f2333442eb5"
  }

   # SQL servers with auditing to storage account destination should be configured with 90 days retention or higher
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/89099bee-89e0-4b26-a5f4-165451757743"
  }

   # Azure Defender for SQL should be enabled for unprotected Azure SQL servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abfb4388-5bf4-4ad7-ba82-2cd2f41ceae9"
  }

   # Azure Defender for SQL should be enabled for unprotected SQL Managed Instances
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9"
  }

   # An Azure Active Directory administrator should be provisioned for SQL servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1f314764-cb73-4fc9-b863-8eca98ac36e9"
  }

   # SQL servers should use customer-managed keys to encrypt data at rest
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0a370ff3-6cab-4e85-8995-295fd854c5b8"
  }

  # SQL managed instances should use customer-managed keys to encrypt data at rest
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ac01ad65-10e5-46df-bdd9-6b0cad13e1d2"
  }

  # Enforce SSL connection should be enabled for MySQL database servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e802a67a-daf5-4436-9ea6-f6d821dd0c5d"
  }

   # Log checkpoints should be enabled for PostgreSQL database servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e43d"
  }

   # Enforce SSL connection should be enabled for PostgreSQL database servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d158790f-bfb0-486c-8631-2dc6b4e8e6af"
  }

   # Log connections should be enabled for PostgreSQL database servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e442"
  }

   # Disconnections should be logged for PostgreSQL database servers.
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e446"
  }

   # Connection throttling should be enabled for PostgreSQL database servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5345bb39-67dc-4960-a1bf-427e16b9a0bd"
  }

   # Azure subscriptions should have a log profile for Activity Log
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7796937f-307b-4598-941c-67d3a05ebfe7"
  }

  # Activity log should be retained for at least one year
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b02aacc0-b073-424e-8298-42b22829ee0a"
  }

  # Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1a4e592a-6a6e-44a5-9814-e36264ca96e7"
  }

  # Azure Monitor should collect activity logs from all regions
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/41388f1c-2db0-4c25-95b2-35d7f5ccbfa9"
  }

  # Storage account containing the container with activity logs must be encrypted with BYOK
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fbb99e8e-e444-4da0-9ff1-75c92f5a85b2"
  }

  # Resource logs in Key Vault should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cf820ca0-f99e-4f3e-84fb-66e913812d21"
  }

  # An activity log alert should exist for specific Policy operations
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c5447c04-a4d7-4ba8-a263-c9ee321a6858"
  }

  # An activity log alert should exist for specific Administrative operations
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b954148f-4c11-4c38-8221-be76711e194a"
  }

  # An activity log alert should exist for specific Security operations
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3b980d31-7904-4bb7-8575-5665739a8052"
  }

  # Network Watcher should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b6e2945c-0b7b-40f5-9233-7a5323b5cdc6"
  }

  # Only approved VM extensions should be installed
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432"
  }

  # Key Vault keys should have an expiration date
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/152b15f7-8e1f-4c1f-ab71-8c010ba5dbc0"
  }

  # Key Vault secrets should have an expiration date
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/98728c90-32c7-4049-8429-847dc0f4fe37"
  }

   # Key vaults should have purge protection enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53"
  }

   # Role-Based Access Control (RBAC) should be used on Kubernetes Services
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ac4a19c2-fa67-49b4-8ae5-0b2e78c49457"
  }

   # Authentication should be enabled on your API app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c4ebc54a-46e1-481a-bee2-d4411e95d828"
  }

    # Authentication should be enabled on your Function app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c75248c1-ea1d-4a9c-8fc9-29a6aabd5da8"
  }

  # Authentication should be enabled on your web app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/95bccee9-a7f8-4bec-9ee9-62c3473701fc"
  }

  # Web Application should only be accessible over HTTPS
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d"
  }

  # Latest TLS version should be used in your API App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e"
  }

  # Latest TLS version should be used in your Function App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193"
  }

 # Latest TLS version should be used in your Web App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b"
  }

  # Ensure API app has 'Client Certificates (Incoming client certificates)' set to 'On'
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0c192fe8-9cbb-4516-85b3-0ade8bd03886"
  }

 # Function apps should have 'Client Certificates (Incoming client certificates)' enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eaebaea7-8013-4ceb-9d14-7eb32271373c"
  }

  # Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5bb220d9-2698-4ee4-8404-b9c30c9df609"
  } 

 # Managed identity should be used in your API App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c4d441f8-f9d9-4a9e-9cef-e82117cb3eef"
  }

# Managed identity should be used in your Function App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0da106f2-4ca3-48e8-bc85-c638fe6aea8f"
  }

# Managed identity should be used in your Web App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2b9ad585-36bc-4615-b300-fd4435808332"
  }

  # Ensure that 'PHP version' is the latest, if used as a part of the API app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1bc1795e-d44a-4d48-9b3b-6fff0fd5f9ba"
  }

  # Ensure that 'PHP version' is the latest, if used as a part of the WEB app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7261b898-8a84-4db8-9e04-18527132abb3"
  }

   # Ensure that 'Python version' is the latest, if used as a part of the API app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/74c3584d-afae-46f7-a20a-6f8adba71a16"
  }

    # Ensure that 'Python version' is the latest, if used as a part of the Function app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7238174a-fd10-4ef0-817e-fc820a951d73"
  }

    # Ensure that 'Python version' is the latest, if used as a part of the Web app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7008174a-fd10-4ef0-817e-fc820a951d73"
  }

     # Ensure that 'Java version' is the latest, if used as a part of the API app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/88999f4c-376a-45c8-bcb3-4058f713cf39"
  }

 # Ensure that 'Java version' is the latest, if used as a part of the Function app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9d0b6ea4-93e2-4578-bf2f-6bb17d22b4bc"
  }

 # Ensure that 'Java version' is the latest, if used as a part of the Web app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/496223c3-ad65-4ecd-878a-bae78737e9ed"
  } 

 # Ensure that 'HTTP Version' is the latest, if used to run the API app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/991310cd-e9f3-47bc-b7b6-f57b557d07db"
  }

# Ensure that 'HTTP Version' is the latest, if used to run the Function app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e2c1c086-2d84-4019-bff3-c44ccd95113c"
  }

 # Ensure that 'HTTP Version' is the latest, if used to run the Web app
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8c122334-9d20-4eb8-89ea-ac9a705b74ae"
  } 

  # Resource logs in Azure Key Vault Managed HSM should be enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a2a5b911-5617-447e-a49e-59dbe0e0434b"
  } 

   # Azure Key Vault Managed HSM should have purge protection enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c39ba22d-4428-4149-b981-70acb31fc383"
  } 

   # FTPS only should be required in your API App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9a1b8c48-453a-4044-86c3-d8bfd823e4f5"
  }

    # FTPS only should be required in your Function App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/399b2637-a50f-4f95-96f8-3a145476eb15"
  } 

     # FTPS should be required in your Web App
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4d24b6d4-5e53-4a4f-a7f4-618fa573ee4b"
  }                
} 



