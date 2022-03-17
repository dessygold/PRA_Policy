variable "policy_assignment_name" {
  
}

variable "policy_assignment_scope" {
  
}

variable "policy_definition_id" {
  
}

variable "location" {
  
}

variable "activitylog_operationName" {
  description = "Policy Operation name for which activity log alert should exist"
  default     = "Microsoft.Authorization/policyAssignments/write"
}

variable "activitylog_admin_operationName" {
  description = "Policy Operation name for which activity log alert should exist"
  default     = "Microsoft.Sql/servers/firewallRules/write"
}

variable "activitylog_sec_operationName" {
  description = "Security Operation name for which activity log alert should exist"
  default     = "Microsoft.Security/policies/write"
}
