resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.name}-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space       = [var.network_address_space]

  tags = var.tags

}

resource "azurerm_subnet" "public1_subnet" {
  name                 = "${var.name}-public1-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.public1_subnet_address_prefix]

}

resource "azurerm_subnet" "public2_subnet" {
  name                 = "${var.name}-public2-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.public2_subnet_address_prefix]

}


resource "azurerm_subnet" "public3_subnet" {
  name                 = "${var.name}-public3-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.public3_subnet_address_prefix]

}

resource "azurerm_subnet" "private1_subnet" {
  name                 = "${var.name}-private1-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.private4_subnet_address_prefix]

}

resource "azurerm_subnet" "private2_subnet" {
  name                 = "${var.name}-private2-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.private5_subnet_address_prefix]

}
resource "azurerm_subnet" "private3_subnet" {
  name                 = "${var.name}-private3-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.private6_subnet_address_prefix]

}