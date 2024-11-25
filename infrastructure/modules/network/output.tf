
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
  description = "ID of the virtual network"
}

output "subnet_api_id" {
  value = azurerm_subnet.api_subnet.id
  description = "ID of the API subnet"
}

output "subnet_database_id" {
  value = azurerm_subnet.database_subnet.id
  description = "ID of the database subnet"
}

output "subnet_storage_id" {
  value = azurerm_subnet.storage_subnet.id
  description = "ID of the storage subnet"
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
  description = "ID of the Network Security Group"
}

output "subnet_appservice_id" {
  value = azurerm_subnet.appservice_subnet.id
  description = "ID of the App Service subnet"
}
