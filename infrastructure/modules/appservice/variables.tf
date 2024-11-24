# Localisation et groupe de ressources
variable "location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resources"
}

variable "resource_group_name" {
  type        = string
  default     = "cloud_computing_project"
  description = "Name of the resource group in which all resources are grouped"
}

# App Service variables
variable "app_service_plan_name" {
  type        = string
  default     = "my-app-service-plan"
  description = "Name of the App Service plan"
}

variable "app_service_plan_tier" {
  type        = string
  default     = "Basic"
  description = "Tier of the App Service plan"
}

variable "app_service_plan_size" {
  type        = string
  default     = "B1"
  description = "Size of the App Service plan"
}

variable "app_service_name" {
  type        = string
  default     = "my-app-service"
  description = "Name of the App Service"
}

variable "linux_fx_version" {
  type        = string
  default     = "DOCKER|nginx:latest"
  description = "Linux FX version for the App Service"
}

variable "always_on" {
  type        = bool
  default     = true
  description = "Whether the App Service should always be on"
}

# Database variables
variable "database_server_name" {
  type        = string
  default     = "my-database-server"
  description = "Name of the database server"
}

variable "database_name" {
  type        = string
  default     = "mydatabase"
  description = "Name for the database within the server"
}

variable "database_username" {
  type        = string
  default     = "adminuser"
  description = "Administrator username for the database"
}

variable "database_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for the database"
}