# Private VMs

resource "azurerm_virtual_machine" "vm-private1" {
  name                  = "${var.name}-vm-private1"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic-priv1.id]

  storage_os_disk {
    name              = "${var.name}-vm-private1-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.name}-vm-private1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "vm-private2" {
  name                  = "${var.name}-vm-private2"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic-priv2.id]

  storage_os_disk {
    name              = "${var.name}-vm-private2-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.name}-vm-private2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags
}
