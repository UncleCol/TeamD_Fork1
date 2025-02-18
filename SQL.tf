#SQL Database 1 configuration

resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.name}-sql-server"
  resource_group_name          = data.azurerm_resource_group.resource_group.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  tags = var.tags
}

resource "azurerm_sql_database" "sql_database" {
  count                        = length(var.availability_zones)
  name                         = "${var.name}-sql-database-${count.index + 1}"
  resource_group_name          = data.azurerm_resource_group.resource_group.name
  location                     = var.location
  server_name                  = azurerm_sql_server.sql_server.name
  edition                      = "Standard"
  requested_service_objective_name = "S1"
  zone_redundant               = true

  tags = var.tags
}

resource "azurerm_sql_failover_group" "failover_group" {
  name                = "${var.name}-failover-group"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  databases           = [for i in azurerm_sql_database.sql_database : i.name]

  partner_servers {
    id = azurerm_sql_server.sql_server.id
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 5
  }

  tags = var.tags
}