resource "azurerm_postgresql_server" "db_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  version             = var.version_db
  storage_mb          = var.storage_mb
  backup_retention_days = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
  public_network_access_enabled = false
}

resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.db_server.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_private_endpoint" "db_private_endpoint" {
  name                = "${var.database_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.database_name}-connection"
    private_connection_resource_id = azurerm_postgresql_server.db_server.id
    is_manual_connection           = false
  }
}

locals {
  database_connection = {
    host = azurerm_postgresql_server.db_server.fqdn
    port = 5432
  }

  database = {
    name     = var.database_name
    username = var.admin_username
    password = var.admin_password
  }
}
