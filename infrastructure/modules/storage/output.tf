output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "ID of the storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "Name of the storage account"
}

output "storage_account_connection_string" {
  value       = azurerm_storage_account.storage.primary_connection_string
  description = "Connection string for the storage account"
}

output "storage_account_primary_key" {
  value       = azurerm_storage_account.storage.primary_access_key
  description = "Primary access key for the storage account"
}

output "storage_container_name" {
  value       = azurerm_storage_container.container.name
  description = "Name of the storage container"
}

output "storage_container_id" {
  value       = azurerm_storage_container.container.id
  description = "ID of the storage container"
}
