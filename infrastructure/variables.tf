# Localisation et groupe de ressources
variable "location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resources"
  nullable    = false
}

variable "resource_group_name" {
  type        = string
  default     = "cloud_computing_project"
  description = "Name of the resource group in which all resources are grouped"
  nullable    = false
}

# Réseau virtuel et sous-réseaux
variable "vnet_name" {
  type        = string
  default     = "my-vnet"
  description = "Name of the virtual network"
  nullable    = false
}

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "CIDR range for the virtual network"
  nullable    = false
}

variable "subnet_api_name" {
  type        = string
  default     = "api-subnet"
  description = "Name of the subnet for the API service"
  nullable    = false
}

variable "subnet_api_prefix" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR range for the API subnet"
  nullable    = false
}

variable "subnet_database_name" {
  type        = string
  default     = "db-subnet"
  description = "Name of the subnet for the database"
  nullable    = false
}

variable "subnet_database_prefix" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR range for the database subnet"
  nullable    = false
}

variable "subnet_storage_name" {
  type        = string
  default     = "storage-subnet"
  description = "Name of the subnet for the storage account"
  nullable    = false
}

variable "subnet_storage_prefix" {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR range for the storage subnet"
  nullable    = false
}

variable "subnet_appservice_name" {
  type        = string
  default     = "appservice-subnet"
  description = "Name of the subnet for the App Service"
  nullable    = false
}

variable "subnet_appservice_prefix" {
  type        = string
  default     = "10.0.4.0/24"
  description = "CIDR range for the App Service subnet"
  nullable    = false
}

# Network Security Group (NSG)
variable "nsg_name" {
  type        = string
  default     = "my-nsg"
  description = "Name of the Network Security Group"
  nullable    = false
}

variable "allow_http" {
  type        = bool
  default     = false
  description = "Allow HTTP access"
  nullable    = false
}

variable "allow_https" {
  type        = bool
  default     = true
  description = "Allow HTTPS access"
  nullable    = false
}

# App Service variables
variable "app_service_plan_name" {
  type        = string
  default     = "my-app-service-plan"
  description = "Name of the App Service plan"
  nullable    = false
}

variable "app_service_plan_tier" {
  type        = string
  default     = "Basic"
  description = "Tier of the App Service plan"
  nullable    = false
}

variable "app_service_plan_size" {
  type        = string
  default     = "B1"
  description = "Size of the App Service plan"
  nullable    = false
}

variable "app_service_name" {
  type        = string
  default     = "my-app-service"
  description = "Name of the App Service"
  nullable    = false
}

variable "linux_fx_version" {
  type        = string
  default     = "DOCKER|nginx:latest"
  description = "Linux FX version for the App Service"
  nullable    = false
}

variable "always_on" {
  type        = bool
  default     = true
  description = "Whether the App Service should always be on"
  nullable    = false
}

# Azure AD variables
variable "azure_ad_user_object_id" {
  type        = string
  description = "Object ID of the Azure AD user"
  nullable    = false
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
  nullable    = false
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  nullable    = false
}

variable "email_address" {
  type        = string
  description = "Email address for administrative purposes"
  nullable    = false
}

# Database variables
variable "database_server_name" {
  type        = string
  default     = "my-database-server"
  description = "Name of the database server"
  nullable    = false
}

variable "database_name" {
  type        = string
  default     = "mydatabase"
  description = "Name for the database within the server"
  nullable    = false
}

variable "database_username" {
  type        = string
  default     = "adminuser"
  description = "Administrator username for the database"
  nullable    = false
}

variable "database_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for the database"
  nullable    = false
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account"
}

variable "container_name" {
  type        = string
  default     = "api"
  description = "Name of the Blob Storage container"
}

variable "service_principal_id" {
  type        = string
  default     = null
  description = "ID of the service principal to grant access to the Blob Storage container"
}

variable "user_principal_id" {
  type        = string
  default     = null
  description = "ID of the user principal to grant access to the Blob Storage container"
}

# Nom de l'image Docker (gérée par le pipeline CI/CD)
variable "docker_image" {
  type        = string
  description = "Nom de l'image Docker à déployer sur l'App Service"
}

# URL du registre Docker (par défaut Docker Hub)
variable "docker_registry_url" {
  type        = string
  default     = "https://index.docker.io"
  description = "URL du registre Docker pour l'image"
}

variable "new_relic_api_key" {
  description = "The API key for New Relic"
  type        = string
  sensitive   = true
}

