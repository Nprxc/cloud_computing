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

  entra_administrator_tenant_id      = var.tenant_id
  entra_administrator_object_id      = var.azure_ad_user_object_id
  entra_administrator_principal_type = "User"
  entra_administrator_principal_name = var.email_address

  server_name                     = var.database_server_name
  database_administrator_login    = var.database_username
  database_administrator_password = var.database_password
  database_name                   = var.database_name
}

locals {
  database_connection = {
    host = try(module.database[0].server_address, null)
    port = try(module.database[0].port, null)
  }
}