
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}-${var.environment}-forked-rg"
  location = var.location
}