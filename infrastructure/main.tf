# Groupe de ressources
resource "azurerm_resource_group" "cloud_computing_project" {
  name     = var.resource_group_name
  location = var.location
}

# Module réseau
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
