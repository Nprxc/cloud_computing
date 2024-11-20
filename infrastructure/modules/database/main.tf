#modules/database/main.tf

# Zone DNS privée
resource "azurerm_private_dns_zone" "my_dns_zone" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

# Lien DNS privé avec le VNet
resource "azurerm_private_dns_zone_virtual_network_link" "my_dns_zone_link" {
  name                  = "dns-zone-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.my_dns_zone.name
  virtual_network_id    = var.vnet_id
}
resource "azurerm_postgresql_flexible_server" "playground_computing" {
  administrator_login           = var.database_administrator_login
  administrator_password        = var.database_administrator_password
  auto_grow_enabled             = false
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  location                      = var.location
  name                          = var.server_name
  public_network_access_enabled = false # Désactiver l'accès public
  resource_group_name           = var.resource_group_name
  sku_name                      = "B_Standard_B1ms"
  storage_tier                  = "P4"
  storage_mb                    = "32768"
  version                       = "16"
  zone                          = "1"

  delegated_subnet_id = var.subnet_id # Utiliser le sous-réseau délégué
  private_dns_zone_id = azurerm_private_dns_zone.my_dns_zone.id # Ajouter l'ID de la zone DNS privée

  depends_on = [
    azurerm_private_dns_zone.my_dns_zone,
    azurerm_private_dns_zone_virtual_network_link.my_dns_zone_link
  ]

  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled         = true
    tenant_id                     = var.entra_administrator_tenant_id
  }
}

# Administrateur Active Directory
resource "azurerm_postgresql_flexible_server_active_directory_administrator" "administrator" {
  tenant_id           = var.entra_administrator_tenant_id
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_flexible_server.playground_computing.name
  principal_type      = var.entra_administrator_principal_type
  object_id           = var.entra_administrator_object_id
  principal_name      = var.entra_administrator_principal_name
}

# Création de la base de données
resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.playground_computing.id
}
