# Module for PRA Baseline Policy Definition scope at management group level
 module "azurePolicy_pra_prodsub" {
    source = "../Modules/AzurePolicy_Module"
    policy_definition_name = "pra_baseline_policy_controls01"
    management_group_name    = data.azurerm_management_group.pra_prod_mgmtGp.name
}

# Module for PRA Baseline Policy Assignment scope at management group level
 module "azurePolicyAssignment_pra_prodsub" {
    source = "../Modules/AzurePolicyAssignment_Module"
    policy_definition_id = module.azurePolicy_pra_prodsub.policy_set_definition_id
    policy_assignment_name = "policy-assignment" # 3 - 24 character
    policy_assignment_scope = data.azurerm_management_group.pra_prod_mgmtGp.id
    location                = "eastus"

    #management_group_id    = data.azurerm_management_group.pra_prod_mgmtGp.id
}
