
resource "azurerm_resource_group" "auto_rg" {
  name     = "auto_rg"
  location = "westus"
}

resource "azurerm_virtual_network" "auto_vnet" {
  name                = "auto-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.auto_rg.location
  resource_group_name = azurerm_resource_group.auto_rg.name
}

resource "azurerm_subnet" "auto_subnet" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.auto_rg.name
  virtual_network_name = azurerm_virtual_network.auto_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic_test" {
  count               = 2
  name                = "auto-nic${count.index}"
  location            = azurerm_resource_group.auto_rg.location
  resource_group_name = azurerm_resource_group.auto_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.auto_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  count                 = 2
  name                  = "auto-VM${count.index}"
  resource_group_name   = azurerm_resource_group.auto_rg.name
  location              = azurerm_resource_group.auto_rg.location
  size                  = "Standard_B2ms"
  admin_username        = "adminuser"
  admin_password        = "Password1234@"
  network_interface_ids = [element(azurerm_network_interface.nic_test.*.id, count.index)]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}