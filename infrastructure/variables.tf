# Localisation et groupe de ressources
variable "location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resources"
}

variable "resource_group_name" {
  type        = string
  default     = "week-3"
  description = "Name of the resource group in which all resources are grouped"
}

# Réseau virtuel et sous-réseaux
variable "vnet_name" {
  type        = string
  default     = "my-vnet"
  description = "Name of the virtual network"
}

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "CIDR range for the virtual network"
}

variable "subnet_api_name" {
  type        = string
  default     = "api-subnet"
  description = "Name of the subnet for the API service"
}

variable "subnet_api_prefix" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR range for the API subnet"
}

variable "subnet_database_name" {
  type        = string
  default     = "db-subnet"
  description = "Name of the subnet for the database"
}

variable "subnet_database_prefix" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR range for the database subnet"
}

variable "subnet_storage_name" {
  type        = string
  default     = "storage-subnet"
  description = "Name of the subnet for the storage account"
}

variable "subnet_storage_prefix" {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR range for the storage subnet"
}

# Network Security Group (NSG)
variable "nsg_name" {
  type        = string
  default     = "my-nsg"
  description = "Name of the Network Security Group"
}

variable "allow_http" {
  type        = bool
  default     = false
  description = "Allow HTTP access"
}

variable "allow_https" {
  type        = bool
  default     = true
  description = "Allow HTTPS access"
}

# Identité (variables sensibles uniquement nécessaires pour l'accès)
variable "subscription_id" {
  type        = string
  nullable    = false
  description = "Azure subscription ID"
}

variable "email_address" {
  type        = string
  nullable    = false
  description = "Email address for administrative purposes"
}
