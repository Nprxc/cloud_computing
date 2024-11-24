# Output pour la connexion au Blob Storage
output "storage_account_connection_string" {
  value       = azurerm_storage_account.storage.primary_connection_string
  description = "Connection string for the storage account"
}

output "storage_container_name" {
  value       = azurerm_storage_container.container.name
  description = "Name of the storage container"
}
