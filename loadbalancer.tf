# Load balancer for VMs
resource "azurerm_lb" "lb" {
  name                = "${var.name}-${var.environment}-lb" # TODO ref env in name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "${var.name}-frontend-ip"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Static"

  tags = var.tags
}
