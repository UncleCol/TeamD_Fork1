
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}-forked-rg"
  location = "var.location"
}