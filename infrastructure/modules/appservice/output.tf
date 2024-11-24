output "url" {
  value       = "https://${azurerm_linux_web_app.app_service.default_hostname}/"
  description = "URL publique pour accéder à l'App Service"
}

output "principal_id" {
  value       = azurerm_linux_web_app.app_service.identity[0].principal_id
  description = "ID principal de l'identité managée de l'App Service"
}
