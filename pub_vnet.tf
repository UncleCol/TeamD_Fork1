# Public Vnet
resource "azurerm_virtual_network" "public_vnet" {
  name                = "${var.name}-public-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space       = [var.network_address_space]

  tags = var.tags
}

# Subnets
resource "azurerm_subnet" "public1_subnet" {
  name                 = "${var.name}-public1-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = [var.public1_subnet_address_prefix]
}

resource "azurerm_subnet" "public2_subnet" {
  name                 = "${var.name}-public2-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = [var.public2_subnet_address_prefix]
}

resource "azurerm_subnet" "public3_subnet" {
  name                 = "${var.name}-public3-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = [var.public3_subnet_address_prefix]
}

# Public Network Interfaces
resource "azurerm_network_interface" "nic-pub1" {
  name                = "${var.name}-nic-public1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-public1"
    subnet_id                     = azurerm_subnet.public1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-pub2" {
  name                = "${var.name}-nic-public2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-public2"
    subnet_id                     = azurerm_subnet.public2_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}
resource "azurerm_network_interface" "nic-pub3" {
  name                = "${var.name}-nic-public3"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-public3"
    subnet_id                     = azurerm_subnet.public3_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}