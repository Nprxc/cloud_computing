data "azurerm_subscription" "current" {
}

data "azuread_user" "user" {
  user_principal_name = var.email_address
}

data "github_user" "user" {
  username = var.github_handle
}

resource "azurerm_resource_group" "cloud_computing_project" {
  name     = var.resource_group_name
  location = var.location
}

locals {
  resource_group = azurerm_resource_group.week_3.name
  location       = azurerm_resource_group.week_3.location
  app_name       = "examples-api-${var.github_handle}"
}


module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location
  app_name            = local.app_name
  pricing_plan        = "P0v3"
  docker_image        = "fhuitelec/examples-api:2.1.0"
  docker_registry_url = "https://ghcr.io"
  app_settings        = {
    DATABASE_HOST     = local.database_connection.host
    DATABASE_PORT     = local.database_connection.port
    DATABASE_NAME     = local.database.name
    DATABASE_USER     = local.database.username
    DATABASE_PASSWORD = local.database.password
    STORAGE_ACCOUNT_URL = local.storage_url
    NEW_RELIC_LICENSE_KEY = var.new_relic_licence_key
    NEW_RELIC_APP_NAME    = local.app_name
  }
  subnet_id = module.network.subnet_api_id
}


module "database" {
  source                      = "./modules/database"
  resource_group_name         = azurerm_resource_group.cloud_computing_project.name
  location                    = azurerm_resource_group.cloud_computing_project.location
  server_name                 = local.database.server_name
  database_name               = local.database.name
  database_administrator_login = local.database.username
  database_administrator_password = local.database.password
  sku_name                    = "B_Gen5_1"
  storage_mb                  = 5120
  backup_retention_days       = 7
  geo_redundant_backup        = false
  ssl_enforcement_enabled     = true
  charset                     = "UTF8"
  collation                   = "en_US.utf8"
  subnet_id                   = module.network.subnet_database_id
}


module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.cloud_computing_project.name
  location            = azurerm_resource_group.cloud_computing_project.location

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
