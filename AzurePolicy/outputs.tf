output "policy_definition_id" {
    value = module.azurePolicy_pra_prodsub.policy_set_definition_id
}

output "policy_definition_Assignment_id" {
    value = module.azurePolicyAssignment_pra_prodsub.policy_set_assignment_id
}