output "app_service_id" {
  value       = azurerm_app_service.app_service.id
  description = "ID de l'App Service"
}

output "app_service_default_hostname" {
  value       = azurerm_app_service.app_service.default_hostname
  description = "Nom de domaine par défaut de l'App Service"
}
