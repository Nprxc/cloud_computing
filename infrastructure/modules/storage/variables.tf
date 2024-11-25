variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "container_name" {
  type        = string
  default     = "Blob Storage container"
  description = "Name of the blob container"
}

variable "service_principal_id" {
  type        = string
  default     = null
  description = "Service Principal ID for role assignment"
}

variable "user_principal_id" {
  type        = string
  default     = null
  description = "User Principal ID for role assignment"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location for the resources"
}

variable "appservice_principal_id" {
  description = "Principal ID of the App Service's managed identity"
  type        = string
  nullable    = false
}
