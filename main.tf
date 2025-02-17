
resource "azurerm_resource_group" "resource_group" {
  name     = data.azurerm_resource_group.resource_group.name
  location = "var.location"
}