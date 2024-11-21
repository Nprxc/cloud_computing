# Output pour le nom de domaine complet (FQDN) du serveur PostgreSQL flexible
output "server_address" {
  value       = azurerm_postgresql_flexible_server.playground_computing.fqdn 
  description = "Hostname to connect to the database server"                 
}

# Output pour le port utilisé par l'instance PostgreSQL
output "port" {
  value       = 5432                                                         
  description = "Port of the database instance"                              
}

# Output pour l'ID de la zone DNS privée associée
output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.my_dns_zone.id                      
  description = "Private DNS Zone ID associated with the database server"    
}
