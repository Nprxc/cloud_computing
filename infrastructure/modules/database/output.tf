# modules/database/outputs.tf

output "server_address" {
  value       = azurerm_postgresql_server.db_server.fully_qualified_domain_name
  description = "Fully qualified domain name of the PostgreSQL server"
}

output "database_name" {
  value       = azurerm_postgresql_database.database.name
  description = "Name of the database"
}

output "database_administrator_login" {
  value       = azurerm_postgresql_server.db_server.administrator_login
  description = "Database administrator login username"
}
