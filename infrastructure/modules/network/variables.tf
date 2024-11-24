# modules/network/variables.tf

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location for the resources"
}

variable "subnet_api_name" {
  type        = string
  description = "Name of the API subnet"
}

variable "subnet_api_prefix" {
  type        = string
  description = "CIDR prefix for the API subnet"
}

variable "subnet_database_name" {
  type        = string
  description = "Name of the database subnet"
}

variable "subnet_database_prefix" {
  type        = string
  description = "CIDR prefix for the database subnet"
}

variable "subnet_storage_name" {
  type        = string
  description = "Name of the storage subnet"
}

variable "subnet_storage_prefix" {
  type        = string
  description = "CIDR prefix for the storage subnet"
}

variable "subnet_appservice_name" {
  type        = string
  description = "Name of the App Service subnet"
}

variable "subnet_appservice_prefix" {
  type        = string
  description = "Address prefix for the App Service subnet"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "allow_http" {
  type        = bool
  default     = false
  description = "Allow HTTP access"
}

variable "allow_https" {
  type        = bool
  default     = false
  description = "Allow HTTPS access"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}
