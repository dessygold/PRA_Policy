# Module for PRA Baseline scope at management group level
 module "azurePolicy_pra_prodsub" {
    source = "../Modules/AzurePolicy_Module"
    policy_definition_name = "pra_baseline_policy_controls01"
    management_group_id    = data.azurerm_management_group.pra_prod_mgmtGp.id
}

