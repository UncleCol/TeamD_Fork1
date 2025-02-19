# # TODO Look at this Monday 
# # swap values to match our system
# resource "azurerm_virtual_network" "vnet1" {
#   name                = "vnet1"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_virtual_network" "vnet2" {
#   name                = "vnet2"
#   address_space       = ["10.1.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_virtual_network_peering" "vnet1-to-vnet2" {
#   name                      = "vnet1-to-vnet2"
#   resource_group_name       = azurerm_resource_group.example.name
#   virtual_network_name      = azurerm_virtual_network.vnet1.name
#   remote_virtual_network_id = azurerm_virtual_network.vnet2.id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
# }

# resource "azurerm_virtual_network_peering" "vnet2-to-vnet1" {
#   name                      = "vnet2-to-vnet1"
#   resource_group_name       = azurerm_resource_group.example.name
#   virtual_network_name      = azurerm_virtual_network.vnet2.name
#   remote_virtual_network_id = azurerm_virtual_network.vnet1.id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
# }