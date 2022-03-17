variable "allowedRegions" {
  description = "allowed regions for resource provisioning"
  default = [
      "eastus",
      "eastus2",
      "westus",
      "westus2",
      "centralus",
      "global"
  ]
}