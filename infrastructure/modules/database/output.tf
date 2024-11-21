output "server_address" {
  value = azurerm_postgresql_flexible_server.playground_computing.fqdn
  description = "Hostname to connect to the database server"
}

output "port" {
  value = 5432
  description = "Port of the database instance"
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.my_dns_zone.id
}
