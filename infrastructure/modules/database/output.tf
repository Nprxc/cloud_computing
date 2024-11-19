output "database" {
  value = {
    host     = azurerm_postgresql_server.db_server.fqdn
    port     = 5432
    database = var.database_name
    username = var.admin_username
    password = var.admin_password
  }
  sensitive   = true
  description = "Connection details for the PostgreSQL database"
}
output "fqdn" {
  value       = azurerm_postgresql_server.db_server.fqdn
  description = "Fully qualified domain name of the PostgreSQL server"
}

output "admin_username" {
  value       = var.admin_username
  description = "Administrator username for the database"
}

output "database_name" {
  value       = var.database_name
  description = "Database name"
}


output "server_address" {
  value       = azurerm_postgresql_server.db_server.fqdn
  description = "FQDN of the PostgreSQL server"
}

output "private_endpoint_ip" {
  value       = azurerm_private_endpoint.db_private_endpoint.private_service_connection[0].private_ip_address
  description = "Private IP address of the database private endpoint"
}
