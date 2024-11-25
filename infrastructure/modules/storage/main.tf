# Création du compte de stockage
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Création d'un conteneur Blob privé
resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# Attribution de rôle pour un service principal (par ex. App Service ou autre)
resource "azurerm_role_assignment" "service_binding" {
  count = var.service_principal_id != null ? 1 : 0

  scope                = azurerm_storage_container.container.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.service_principal_id
}

# Attribution de rôle pour un utilisateur spécifique
resource "azurerm_role_assignment" "user_binding" {
  count = var.user_principal_id != null ? 1 : 0

  scope                = azurerm_storage_container.container.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.user_principal_id
}

resource "azurerm_storage_blob" "blob_storage" {
  depends_on = [azurerm_storage_account.storage]
  name = "quotes.json"
  # Get the quotes.json file from the modules/storage directory and upload it to the storage account
  source                 = "${path.module}/quotes.json"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.container_name
  type                   = "Block"
}
