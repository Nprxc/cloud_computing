# modules/network/main.tf

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "api_subnet" {
  name                 = var.subnet_api_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_api_prefix]
}

resource "azurerm_subnet" "database_subnet" {
  name                 = var.subnet_database_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_database_prefix]
}

resource "azurerm_subnet" "storage_subnet" {
  name                 = var.subnet_storage_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_storage_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_http" {
  count                    = var.allow_http ? 1 : 0
  name                     = "Allow-HTTP"
  priority                 = 100
  direction                = "Inbound"
  access                   = "Allow"
  protocol                 = "Tcp"
  source_port_range        = "*"
  destination_port_range   = "80"
  source_address_prefix    = "Internet"
  destination_address_prefix = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name

  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_https" {
  count                    = var.allow_https ? 1 : 0
  name                     = "Allow-HTTPS"
  priority                 = 110
  direction                = "Inbound"
  access                   = "Allow"
  protocol                 = "Tcp"
  source_port_range        = "*"
  destination_port_range   = "443"
  source_address_prefix    = "Internet"
  destination_address_prefix = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name

  resource_group_name = var.resource_group_name
}