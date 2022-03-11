data "azurerm_resource_group" "log" {
  name = "auto_rg"
}
resource "azurerm_automation_account" "test" {
  name                = "testautomation"
  location            = data.azurerm_resource_group.log.location
  resource_group_name = data.azurerm_resource_group.log.name
  sku_name            = "Basic"

  tags = {
    environment = "dev"
  }
}