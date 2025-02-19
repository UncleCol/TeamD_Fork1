# Private Vnet
resource "azurerm_virtual_network" "private_vnet" {
  name                = "${var.name}-${var.environment}-private-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = [var.network_address_space]

  tags = var.tags
}

#  Subnets
resource "azurerm_subnet" "private1_subnet" {
  name                 = "${var.name}-${var.environment}-private1-subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.private1_subnet_address_prefix]
}

resource "azurerm_subnet" "private2_subnet" {
  name                 = "${var.name}-${var.environment}-private2-subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.private2_subnet_address_prefix]
}

resource "azurerm_subnet" "lb_subnet" {
  name                 = "${var.name}-${var.environment}-lb-subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.public_subnet_address_prefix]
}

resource "azurerm_subnet" "ag_subnet" {
  name                 = "${var.name}-${var.environment}-ag-subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = [var.ag_subnet_address_prefix]  
}


# Network Interfaces
resource "azurerm_network_interface" "nic-priv1" {
  name                = "${var.name}-${var.environment}-nic-private1"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-${var.environment}-ip-cfg-private1"
    subnet_id                     = azurerm_subnet.private1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-priv2" {
  name                = "${var.name}-${var.environment}-nic-private2"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-${var.environment}-ip-cfg-private2"
    subnet_id                     = azurerm_subnet.private2_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}


resource "azurerm_network_interface" "nic-lb" {
  name                = "${var.name}-${var.environment}-nic-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
	name                          = "${var.name}-${var.environment}-ip-cfg-lb"
	subnet_id                     = azurerm_subnet.lb_subnet.id
	private_ip_address_allocation = "Dynamic"
	public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.tags
}