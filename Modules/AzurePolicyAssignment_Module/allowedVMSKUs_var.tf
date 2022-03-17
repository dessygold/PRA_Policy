variable "listOfAllowedSKUs" {
  description = "allowed Virtual Machine SKUs for deployment"
  default = [
      "standard_b1ls",
      "standard_b2ms",
      "standard_b2s",
      "standard_b4ms",
      "standard_d1",
      "standard_a1"
  ]
}