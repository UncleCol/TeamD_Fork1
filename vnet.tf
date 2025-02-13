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
  address_prefixes     = [var.private1_subnet_address_prefix]

}

resource "azurerm_subnet" "private2_subnet" {
  name                 = "${var.name}-private2-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.private2_subnet_address_prefix]

}
resource "azurerm_subnet" "private3_subnet" {
  name                 = "${var.name}-private3-subnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.private3_subnet_address_prefix]

}

resource "azurerm_network_interface" "nic-pub1" {
  name                = "${var.name}-nic-pub1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-pub1"
    subnet_id                     = azurerm_subnet.public1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-pub2" {
  name                = "${var.name}-nic-pub2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-pub2"
    subnet_id                     = azurerm_subnet.public2_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}
resource "azurerm_network_interface" "nic-pub3" {
  name                = "${var.name}-nic-pub3"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-pub3"
    subnet_id                     = azurerm_subnet.public3_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-priv1" {
  name                = "${var.name}-nic-priv1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-priv1"
    subnet_id                     = azurerm_subnet.private1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-priv2" {
  name                = "${var.name}-nic-priv2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-priv2"
    subnet_id                     = azurerm_subnet.private2_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_network_interface" "nic-priv3" {
  name                = "${var.name}-nic-priv3"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.name}-ip-cfg-priv3"
    subnet_id                     = azurerm_subnet.private3_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}