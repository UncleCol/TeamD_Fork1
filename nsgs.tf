# Group for Public Private VMs
resource "azurerm_network_security_group" "vm_nsg1" {
  name                = "${var.name}-nsg1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

# Create NSG rule to allow vm-pub1 to communicate with vm-pub2
resource "azurerm_network_security_rule" "nsg_rule1" {
  name                        = "${var.name}-nsg-rule1"
  description                 = "Allow traffic from vm-pub1 to vm-pub2"
  priority                    = 1001
  direction                   = "Inbound" # Inbound from priv perspective
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"  # pub
  destination_port_range      = "22" # priv
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.resource_group.name
  network_security_group_name = azurerm_network_security_group.vm_nsg1.name
}

# resource "azurerm_virtual_network_peering" "vnet_peer1" {
#   name                         = "${var.name}-vnet_peer1"
#   resource_group_name          = data.azurerm_resource_group.resource_group.name
#   virtual_network_name         = "${var.name}-vnet/${var.name}-public1-subnet"
#   remote_virtual_network_id    = "subscriptions/${var.subscription_id}/resourceGroups/${data.azurerm_resource_group.resource_group.name}/providers/Microsoft.Network/virtualNetworks/vnet_peer1"
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = true
#   use_remote_gateways          = false
# }

