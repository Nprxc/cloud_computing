# modules/database/main.tf

resource "azurerm_postgresql_server" "db_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name            = var.sku_name
  version             = var.version
  storage_mb          = var.storage_mb
  backup_retention_days = var.backup_retention_days
  geo_redundant_backup = var.geo_redundant_backup

  administrator_login          = var.database_administrator_login
  administrator_login_password = var.database_administrator_password
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

  public_network_access_enabled = false  # Disabled for security
}
resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.db_server.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_postgresql_virtual_network_rule" "db_vnet_rule" {
  name          = "${var.server_name}-vnet-rule"
  resource_group_name = var.resource_group_name
  server_name   = azurerm_postgresql_server.db_server.name
  subnet_id     = var.subnet_id
}
