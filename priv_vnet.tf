# Private Vnet
resource "azurerm_virtual_network" "private_vnet" {
  name                = "${var.name}-private-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space       = [var.network_address_space]

  tags = var.tags
}

# Private Subnets
resource "azurerm_subnet" "private1_subnet" {
  name                 = "${var.name}-private1-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.private1_subnet_address_prefix]
}

resource "azurerm_subnet" "private2_subnet" {
  name                 = "${var.name}-private2-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.private2_subnet_address_prefix]
}



# Private Network Interfaces
resource "azurerm_network_interface" "nic-priv1" {
  name                = "${var.name}-nic-private1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-private1"
    subnet_id                     = azurerm_subnet.private1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-priv2" {
  name                = "${var.name}-nic-private2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-private2"
    subnet_id                     = azurerm_subnet.private2_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}
