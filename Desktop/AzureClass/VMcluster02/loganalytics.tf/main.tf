data "azurerm_resource_group" "log" {
  name = "auto_rg"
}

resource "azurerm_log_analytics_workspace" "log_demo" {
  name                = "LogDemo-01"
  location            = data.azurerm_resource_group.log.location
  resource_group_name = data.azurerm_resource_group.log.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}