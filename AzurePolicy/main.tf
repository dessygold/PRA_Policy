terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}

data "azurerm_management_group" "pra_prod_mgmtGp" {
  name = "Dez-prod-group01"
}