resource "azurerm_app_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux" # ou "Windows", selon votre besoin
  reserved            = true    # obligatoire pour les conteneurs ou le plan Linux

  sku {
    tier = var.app_service_plan_tier # Exemple : "Basic", "Standard", "Premium"
    size = var.app_service_plan_size # Exemple : "B1", "S1", "P1v2"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  site_config {
    linux_fx_version = var.linux_fx_version # Exemple : "DOCKER|nginx:latest" ou null pour Windows
    always_on        = var.always_on        # Active ou désactive le mode Always On
  }

  app_settings = {
    DB_HOST     = var.database_server_name
    DB_PORT     = "5432"
    DB_NAME     = var.database_name
    DB_USER     = var.database_username
    DB_PASSWORD = var.database_password
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "app_service_vnet" {
  app_service_id = azurerm_app_service.app_service.id
  subnet_id      = module.network.subnet_api_id
}