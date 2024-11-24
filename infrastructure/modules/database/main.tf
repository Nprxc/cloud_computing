# Définition d'une zone DNS privée pour les connexions au serveur PostgreSQL flexible
resource "azurerm_private_dns_zone" "my_dns_zone" {
  name                = "privatelink.postgres.database.azure.com" 
  resource_group_name = var.resource_group_name                   
}

# Lien entre la zone DNS privée et le réseau virtuel
resource "azurerm_private_dns_zone_virtual_network_link" "my_dns_zone_link" {
  name                  = "dns-zone-link"                         
  resource_group_name   = var.resource_group_name                 
  private_dns_zone_name = azurerm_private_dns_zone.my_dns_zone.name 
  virtual_network_id    = var.vnet_id                             
}

# Configuration du serveur PostgreSQL flexible
resource "azurerm_postgresql_flexible_server" "playground_computing" {
  administrator_login           = var.database_administrator_login 
  administrator_password        = var.database_administrator_password 
  auto_grow_enabled             = false                            
  backup_retention_days         = 7                                
  geo_redundant_backup_enabled  = false                            
  location                      = var.location                     
  name                          = var.server_name                  
  public_network_access_enabled = false                            
  resource_group_name           = var.resource_group_name          
  sku_name                      = "B_Standard_B1ms"                
  storage_tier                  = "P4"                             
  storage_mb                    = "32768"                          
  version                       = "16"                             
  zone                          = "1"                              

  delegated_subnet_id = var.subnet_id                              
  private_dns_zone_id = azurerm_private_dns_zone.my_dns_zone.id    

  # Dépendances explicites pour garantir l'ordre de création
  depends_on = [
    azurerm_private_dns_zone.my_dns_zone,
    azurerm_private_dns_zone_virtual_network_link.my_dns_zone_link
  ]

  # Configuration des méthodes d'authentification
  authentication {
    password_auth_enabled = true                                   
  }
}

# Création d'une base de données sur le serveur PostgreSQL flexible
resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name                                    
  server_id = azurerm_postgresql_flexible_server.playground_computing.id 
}