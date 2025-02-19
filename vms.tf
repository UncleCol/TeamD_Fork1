# Private VMs

resource "azurerm_virtual_machine" "vm-private1" {
  name                  = "${var.name}-${var.environment}-vm-private1"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic-priv1.id]

  storage_os_disk {
    name              = "${var.name}-${var.environment}-vm-private1-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.name}-${var.environment}-vm-private1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "vm-private2" {
  name                  = "${var.name}-${var.environment}-vm-private2"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic-priv2.id]

  storage_os_disk {
    name              = "${var.name}-${var.environment}-vm-private2-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

 storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.name}-${var.environment}-vm-private2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags
}
