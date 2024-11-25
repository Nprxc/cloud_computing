# Groupe de ressources
resource "azurerm_resource_group" "cloud_computing_project" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_subscription" "current" {}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location

  subscription_id     = var.subscription_id
  tenant_id           = var.tenant_id

  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space

  subnet_api_name     = var.subnet_api_name
  subnet_api_prefix   = var.subnet_api_prefix
  subnet_database_name = var.subnet_database_name
  subnet_database_prefix = var.subnet_database_prefix
  subnet_storage_name = var.subnet_storage_name
  subnet_storage_prefix = var.subnet_storage_prefix

  nsg_name            = var.nsg_name
  allow_http          = var.allow_http
  allow_https         = var.allow_https
}

module "database" {
  source = "./modules/database"

  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location

  subscription_id     = var.subscription_id
  tenant_id           = var.tenant_id
  
  vnet_id = module.network.vnet_id
  subnet_id = module.network.subnet_database_id
  
  server_name                     = var.database_server_name
  database_administrator_login    = var.database_username
  database_administrator_password = var.database_password
  database_name                   = var.database_name
}

# Module App Service
module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location

  app_name            = var.app_service_name
  pricing_plan        = "B1"
  docker_image        = var.docker_image
  docker_registry_url = var.docker_registry_url

  app_settings = {
    DB_HOST    = module.database.server_address
    DB_PORT    = "5432"
    DB_NAME    = var.database_name
    DB_USER    = var.database_username
    DB_PASSWORD = var.database_password

    STORAGE_ACCOUNT_URL = module.storage.storage_account_url

  }
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location

  storage_account_name = var.storage_account_name
  container_name       = var.container_name

  service_principal_id = var.service_principal_id
  user_principal_id    = var.user_principal_id

  appservice_principal_id = module.appservice.principal_id
}

locals {
  database_connection = {
    host = try(module.database[0].server_address, null)
    port = try(module.database[0].port, null)
  }
}